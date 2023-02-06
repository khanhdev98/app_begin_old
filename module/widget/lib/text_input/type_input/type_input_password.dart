import 'dart:io';

import 'package:content/content.dart';
import 'package:flutter/material.dart';

class TextInputPassword extends StatefulWidget {
  final InputDecoration inputDecoration;
  final bool? showPassword;
  final TextAlign? textAlign;
  final bool? disable;
  final String? textErrRequire;
  final String? name;
  final TextEditingController? controller;
  final Function(String?)? validate;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTap;
  const TextInputPassword(
      {Key? key,
      this.textAlign,
      required this.inputDecoration,
      this.showPassword = false,
      this.autoFocus = false,
      this.textInputAction,
      this.onFieldSubmitted,
      this.focusNode,
      this.onTap,
      this.controller,
      this.validate,
      this.textErrRequire,
      this.name, this.disable})
      : super(key: key);

  @override
  State<TextInputPassword> createState() => _TextInputPasswordState();
}

class _TextInputPasswordState extends State<TextInputPassword> {
  late TextEditingController textEditingController;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  bool showPass = true;

  String? validate(String? value) {
    if (value == null || value == "") {
      return widget.textErrRequire ?? Str.of(context).validate_empty;
    }
    String? result = widget.validate != null ? widget.validate!(value.trim()) : null;
    return result;
  }

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !(widget.disable == true),
      textAlign: widget.textAlign ?? TextAlign.start,
      focusNode: widget.focusNode,
      controller: widget.controller,
      autovalidateMode: autoValidate,
      // onSaved: (value) {
      //   String? result = validate(value);
      //   if (result != null) {
      //     print("pass: focus");
      //     print(FocusScope.of(context).hasFocus);
      //     FocusScope.of(context).requestFocus(widget.focusNode);
      //   }
      // },
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,

      ///validate
      autofocus: widget.autoFocus,
      keyboardType: TextInputType.text,
      validator: (value) {
        String? result = validate(value);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (autoValidate != AutovalidateMode.always) {
            setState(() {
              autoValidate = AutovalidateMode.always;
            });
          }
        });
        return result;
      },

      ///featured
      obscureText: showPass,
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: widget.textInputAction,
      decoration: widget.inputDecoration.copyWith(
        suffixIcon: widget.showPassword ?? false
            ? IconButton(
                padding: EdgeInsets.zero,
                // icon: HaloIcons.visibility,
                icon: showPass
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
              )
            : null,
      ),
    );
  }
}
