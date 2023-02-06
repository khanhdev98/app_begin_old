
import 'package:content/content.dart';
import 'package:flutter/material.dart';

class TextInputDateRange extends StatefulWidget {
  final InputDecoration inputDecoration;
  final TextEditingController? controller;
  final bool? isRequire;
  final String? textErrRequire;
  final String? name;
  final Function(String?)? validate;
  const TextInputDateRange(
      {Key? key, required this.inputDecoration, this.controller, this.isRequire, this.validate, this.textErrRequire, this.name})
      : super(key: key);

  @override
  State<TextInputDateRange> createState() => _TextInputDateRangeState();
}

class _TextInputDateRangeState extends State<TextInputDateRange> {
  late TextEditingController textEditingController;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  ValueNotifier<bool> taping = ValueNotifier(false);

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  String? validate(String? value) {

    if ((value == null || value.trim() == "") && widget.isRequire == true) {
      return widget.textErrRequire ?? Str.of(context).validate_empty;
    }
    String result = widget.validate!(value?.trim() ?? "");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          taping.value = false;
        });
        // final a = showHaloDateRangePicker(
        //   context, null, DateTime(2011), DateTime(2012)
        // );
        // a.then((value) => print(value));
      },
      onTapDown: (_) {
        setState(() {
          taping.value = true;
        });
      },
      child: AnimatedBuilder(
        animation: taping,
        builder: (_, __) => Opacity(
          opacity: taping.value ? 0.7 : 1,
          child: TextFormField(
            controller: textEditingController,
            enabled: false,

            ///validate
            autofocus: false,
            autovalidateMode: autoValidate,
            keyboardType: TextInputType.text,
            validator: (value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  autoValidate = AutovalidateMode.always;
                });
              });
              return validate(value);
            },
            decoration: widget.inputDecoration.copyWith(
                suffixIcon: const Icon(
                  Icons.calendar_month,
                )),
          ),
        ),
      ),
    );
  }
}
