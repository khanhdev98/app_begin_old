import 'package:content/content.dart';
import 'package:flutter/material.dart';

import '../app_input.dart';

class TextInputDate extends StatefulWidget {
  final InputDecoration inputDecoration;
  final Function(DateTime)? onChange;
  final TextEditingController? controller;
  final bool? isRequire;
  final bool? disable;
  final TextAlign? textAlign;
  // final HaloDateTime? fromDate;
  // final HaloDateTime? endDate;
  // final HaloDateTime? initDate;
  final String? textErrRequire;
  final String? name;
  final Function(String?)? validate;
  final StyleInput? styleInput;
  const TextInputDate(
      {Key? key,
      required this.inputDecoration,
      this.controller,
      this.isRequire,
      this.validate,
      this.styleInput,
      this.textErrRequire,
      this.name,
      // this.fromDate,
      // this.endDate,
      // this.initDate,
      this.onChange,
      this.textAlign,
      this.disable})
      : super(key: key);

  @override
  State<TextInputDate> createState() => TextInputDateState();
}

class TextInputDateState extends State<TextInputDate> {
  late TextEditingController textEditingController;
  // HaloDateTime? _value;

  ValueNotifier<bool> taping = ValueNotifier(false);

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
      onTap: () async {
        setState(() {
          taping.value = false;
        });
        // await showHaloDatePicker(
        //   context,
        //   widget.fromDate?.dateTime ?? DateTime.now(),
        //   DateTime(2020),
        //   widget.endDate?.dateTime ?? DateTime(2024),
        // ).then(
        //   (value) {
        //     if (value != null) {
        //       _value = HaloDateTime(value);
        //       if (widget.onChange != null) {
        //         widget.onChange!(value);
        //       }
        //       textEditingController.text = value.formatTimeApp();
        //     }
        //   },
        // );
      },
      child: IgnorePointer(
        child: TextFormField(
          textAlign: widget.textAlign ?? TextAlign.start,
          controller: textEditingController,
          enabled: !(widget.disable == true),

          ///validate
          autofocus: false,
          keyboardType: TextInputType.text,
          validator: (value) {
            return validate(value);
          },
          decoration: widget.inputDecoration.copyWith(
              suffixIcon: const Icon(
            Icons.calendar_month,
          )),
        ),
      ),
    );
  }
}
