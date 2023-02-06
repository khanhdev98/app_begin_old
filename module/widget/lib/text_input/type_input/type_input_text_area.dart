import 'package:content/content.dart';
import 'package:flutter/material.dart';

class TextInputTextArea extends StatefulWidget {
  final int maxLine;
  final String? textErrRequire;
  final String? name;
  final FocusNode? focusNode;
  final bool? disable;
  final bool? autoFocus;
  final InputDecoration inputDecoration;
  final TextEditingController? controller;
  final bool? isRequire;
  final Function(String?)? validate;
  const TextInputTextArea(
      {Key? key,
      required this.inputDecoration,
      this.controller,
      this.isRequire,
      this.validate,
      required this.maxLine,
      this.textErrRequire,
      this.name, this.disable, this.focusNode, this.autoFocus})
      : super(key: key);

  @override
  State<TextInputTextArea> createState() => _TextInputTextAreaState();
}

class _TextInputTextAreaState extends State<TextInputTextArea> {
  late TextEditingController textEditingController;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  String? validate(String? value) {
    if ((value == null || value.trim() == "") && widget.isRequire == true) {
      return widget.textErrRequire ?? Str.of(context).validate_empty;
    }
    String? result = widget.validate != null ? widget.validate!(value?.trim()) : null;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidate,
      textCapitalization: TextCapitalization.sentences,
      maxLines: widget.maxLine,
      controller: widget.controller,
      enabled: !(widget.disable == true),
      autocorrect: true,
      focusNode: widget.focusNode,
      ///validate
      autofocus: widget.autoFocus ?? false,
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
      decoration: widget.inputDecoration,
    );
  }
}
