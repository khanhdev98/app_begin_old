import 'package:content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/material3/icons/app_icon.dart';
import 'package:theme/theme.dart';

class TextInputText extends StatefulWidget {
  final bool isNumber;
  final bool? isEmail;
  final bool? disable;
  final bool? autoFocus;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final String? textErrRequire;
  final String? name;
  final InputDecoration inputDecoration;
  final TextEditingController? controller;
  final bool? isRequire;
  final Function(String?)? onChange;
  final Function(String?)? validate;
  final List<TextInputFormatter>? formatters;
  const TextInputText(
      {Key? key,
      required this.inputDecoration,
      this.controller,
      this.isRequire,
      this.validate,
      this.isNumber = false,
      this.formatters,
      this.disable,
      this.onChange,
      this.isEmail,
      this.textErrRequire,
      this.name,
      this.textAlign,
      this.focusNode,
      this.autoFocus})
      : super(key: key);

  @override
  State<TextInputText> createState() => _TextInputTextState();
}

class _TextInputTextState extends State<TextInputText> {
  late TextEditingController textEditingController;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  bool showClear = false;

  String? validate(String? value) {
    if ((value == null || value.trim() == "") && widget.isRequire == true) {
      return widget.textErrRequire ?? Str.of(context).validate_empty;
    } else if (textEditingController.text != "") {
      String? result = widget.validate != null ? widget.validate!(value?.trim()) : null;
      return result;
    }
    return null;
  }

  late FocusNode focus;

  @override
  void initState() {
    focus = widget.focusNode ?? FocusNode();
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: (widget.disable == true)? TextStyle(color: context.disableTextColor) : null,
        textAlign: widget.textAlign ?? TextAlign.start,
        textCapitalization: TextCapitalization.sentences,
        enabled: !(widget.disable == true),
        controller: textEditingController,
        focusNode: focus,
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
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },

        ///validate
        autofocus: widget.autoFocus ?? false,
        autovalidateMode: autoValidate,
        keyboardType: widget.isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : (widget.isEmail == true ? TextInputType.emailAddress : TextInputType.text),
        validator: (value) {
          if (widget.disable == true) {
          } else {
            String? result = validate(value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (autoValidate != AutovalidateMode.onUserInteraction) {
                setState(() {
                  autoValidate = AutovalidateMode.onUserInteraction;
                });
              }
            });
            return result;
          }
        },
        inputFormatters: [LengthLimitingTextInputFormatter(127), ...?widget.formatters],
        decoration: widget.inputDecoration.copyWith(
            suffixIcon: (textEditingController.text != "" && (widget.disable != true))
                ? IconButton(
                    style: IconButton.styleFrom(
                        minimumSize: const Size(0, 0), maximumSize: const Size(0, 0)),
                    padding: EdgeInsets.zero,
                    icon: AppIcons.cancel,
                    onPressed: () {
                      textEditingController.clear();
                      if (widget.onChange != null) {
                        widget.onChange!('');
                      }
                      setState(() {
                        showClear = false;
                      });
                    },
                  )
                : null));
  }
}
