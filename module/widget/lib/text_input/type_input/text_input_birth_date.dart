import 'package:content/content.dart';
import 'package:flutter/material.dart';

class TextInputBirthDate extends StatefulWidget {
  final InputDecoration inputDecoration;
  final TextEditingController? controller;
  final bool? isRequire;
  final bool? disable;
  final TextAlign? textAlign;
  final String? textErrRequire;
  final String? name;
  final Function(String?)? validate;
  const TextInputBirthDate(
      {Key? key,
      required this.inputDecoration,
      this.controller,
      this.isRequire,
      this.validate,
      this.textErrRequire,
      this.name,
      this.textAlign,
      this.disable})
      : super(key: key);

  @override
  State<TextInputBirthDate> createState() => TextInputBirthDateState();
}

class TextInputBirthDateState extends State<TextInputBirthDate> {
  late TextEditingController textEditingController;
  ValueNotifier<bool> taping = ValueNotifier(false);
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  // HaloDateTime? _value;

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  // HaloDateTime? valueDate() {
  //   return _value;
  // }

  String? validate(String? value) {
    if ((value == null || value.trim() == "") && widget.isRequire == true) {
      return widget.textErrRequire ?? Str.of(context).validate_empty;
    }
    String? result = widget.validate != null ? widget.validate!(value?.trim()) : null;
    return result;
    // return isEmailOrPhone(value?.trim() ?? "") ? null : Str.of(context).validate_format;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.disable != true? () async {
          if (FocusScope.of(context).hasFocus == true) {
            FocusScope.of(context).unfocus();
            await Future.delayed(const Duration(milliseconds: 300));
          }
          setState(() {
            taping.value = false;
          });
          // if (!mounted) return;
          // final a = await showBottomBirthDatePicker(
          //     context,
          //     "Choose Date",
          //     DateTime(DateTime.now().year - 19),
          //     DateTime(1900),
          //     DateTime(DateTime.now().year - 18));
          // if (a != null) {
          //   _value = HaloDateTime(a);
          //   textEditingController.text = a.formatTimeApp();
          // }
        } : null,
        child: IgnorePointer(
          child: TextFormField(
            textAlign: widget.textAlign ?? TextAlign.start,
            controller: textEditingController,
            enabled: !(widget.disable == true),
            autovalidateMode: autoValidate,

            ///validate
            autofocus: false,
            keyboardType: TextInputType.text,
            validator: (value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (autoValidate != AutovalidateMode.always) {
                  setState(() {
                    autoValidate = AutovalidateMode.always;
                  });
                }
              });
              return validate(value);
            },
            decoration: widget.inputDecoration.copyWith(
                suffixIcon: const Icon(
              Icons.calendar_month,
            )),
          ),
        ));
  }
}
