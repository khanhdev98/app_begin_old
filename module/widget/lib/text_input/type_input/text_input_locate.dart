import 'dart:io';

import 'dart:math' as math;
import 'package:content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/theme.dart';
import '../app_input.dart';

class TextInputLocate extends StatefulWidget {
  final bool isNumber;
  final bool? disable;
  final String? textErrRequire;
  final String? name;
  final TextAlign? textAlign;
  final StyleInput? styleInput;
  final InputDecoration inputDecoration;
  final TextEditingController? controller;
  final bool? isRequire;
  final Function(String?)? validate;
  const TextInputLocate(
      {Key? key,
      required this.inputDecoration,
      this.controller,
      this.isRequire,
      this.validate,
      this.isNumber = false,
      this.disable,
      this.styleInput,
      this.textErrRequire,
      this.name,
      this.textAlign})
      : super(key: key);

  @override
  State<TextInputLocate> createState() => _TextInputLocateState();
}

class _TextInputLocateState extends State<TextInputLocate> {
  late TextEditingController textEditingController;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  bool showClear = false;

  String? validate(String? value) {
    if ((value == null || value.trim() == "") && widget.isRequire == true) {
      return widget.textErrRequire ?? Str.of(context).validate_empty;
    }
    String? result = widget.validate != null ? widget.validate!(value?.trim()) : null;

    return result;
  }

  FocusNode focus = FocusNode();

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: TextFormField(
        style: (widget.disable == true)? TextStyle(color: context.disableTextColor) : null,
        textAlign: widget.textAlign ?? TextAlign.start,
        enabled: !(widget.disable == true),
        controller: textEditingController,
        onSaved: (value) {
          String? result = validate(value);
          if (result != null) {
            print("text: focus");
            print(FocusScope.of(context).hasFocus);
            FocusScope.of(context).requestFocus(focus);
          }
        },
        onChanged: (value) {
          if (showClear == true && value == "") {
            setState(() {
              showClear = false;
            });
          }
          if (showClear == false && value != "") {
            setState(() {
              showClear = true;
            });
          }
        },

        ///validate
        autofocus: false,
        autovalidateMode: autoValidate,
        keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) {
          if (widget.disable == true) {
          } else {
            String? result = validate(value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (autoValidate != AutovalidateMode.always) {
                setState(() {
                  autoValidate = AutovalidateMode.always;
                });
              }
            });
            return result;
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(127),
        ],
        decoration: widget.inputDecoration.copyWith(
          suffixIcon: widget.disable != true
              ? Transform.translate(
                  offset: widget.styleInput == StyleInput.outlineBorder
                      ? const Offset(0, 0)
                      : const Offset(0, 0),
                  child: IconButton(
                    style: IconButton.styleFrom(
                        minimumSize: const Size(0, 0), maximumSize: const Size(0, 0)),
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.keyboard_arrow_down, size: 30),
                    onPressed: () {
                      setState(() {
                        showClear = false;
                        textEditingController.text = "";
                      });
                    },
                  ),
                )
              : Transform.translate(
                  offset: widget.styleInput == StyleInput.outlineBorder
                      ? const Offset(0, 0)
                      : const Offset(0, 0),
                  child: IconButton(
                    style: IconButton.styleFrom(
                        minimumSize: const Size(0, 0), maximumSize: const Size(0, 0)),
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.keyboard_arrow_down, size: 30, color: context.outlineColor),
                    onPressed: () {
                      setState(() {
                        showClear = false;
                        textEditingController.text = "";
                      });
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

// TextSpan floating(bool isFocus,String text) {
//   if(text.contains('*') && isFocus){

//   } else {

//   }
// }
