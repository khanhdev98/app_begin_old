import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/theme.dart';
import 'package:widget/text_input/type_input/text_input_locate.dart';
import 'package:widget/text_input/type_input/type_input_text_area.dart';

import 'type_input/text_input_birth_date.dart';
import 'type_input/text_input_date.dart';
import 'type_input/text_input_date_range.dart';
import 'type_input/type_input_password.dart';
import 'type_input/type_input_text.dart';

enum StyleInput { underline, outlineBorder }

enum TypeInput { password, text, date, locate, dateRange, birthDate, textArea, number, decimal }

class AppInput extends StatefulWidget {
  TextEditingController? textEditingController;
  bool? isCenter;
  final TypeInput typeInput;

  String? name;
  String? textErrRequire;
  bool? disable;
  String? labelText;
  Function(String?)? validate;
  bool? isRequire;
  Function(String?)? onChange;
  int maxLine = 1;
  StyleInput? styleInput;
  String? hintText;
  Widget? labelWidget;
  List<dynamic>? listData;
  TextInputAction? textInputAction;
  TextAlign? textAlign;
  int? errorMaxLines;
  Widget? prefixIcon;

  /// chi ap dung khi required == true;
  bool? unShowStar;

  ///type date
  // HaloDateTime? fromDate;
  // HaloDateTime? endDate;
  // HaloDateTime? initDate;
  Function(DateTime)? onChangeDate;
  DateTime? dataDate;

  ///type text
  String? dataText;

  ///type password
  bool? showPassword;
  String? textCompareValidate;
  bool? autoFocus;
  Function(String)? onFieldSubmitted;
  FocusNode? focusNode;
  void Function()? onTap;

  List<TextInputFormatter>? formatters;

  AppInput.password(
      {Key? key,
      this.validate,
      this.prefixIcon,
      this.disable,
      this.textAlign,
      this.textErrRequire,
      this.name,
      this.styleInput = StyleInput.underline,
      this.isCenter = false,
      this.showPassword = false,
      this.autoFocus = false,
      this.onFieldSubmitted,
      this.textInputAction,
      this.focusNode,
      this.onTap,
      this.textEditingController,
      this.labelText})
      : typeInput = TypeInput.password,
        super(key: key);

  AppInput.text(
      {Key? key,
      this.validate,
      this.prefixIcon,
      this.textAlign,
      this.textErrRequire,
      this.name,
      this.unShowStar,
      this.autoFocus,
      this.onChange,
      this.disable,
      this.styleInput = StyleInput.underline,
      this.hintText,
      this.focusNode,
      this.isRequire = false,
      this.isCenter = false,
      this.textEditingController,
      this.labelText,
      this.errorMaxLines})
      : typeInput = TypeInput.text,
        super(key: key);

  AppInput.number(
      {Key? key,
      this.isCenter = false,
      this.unShowStar,
      this.prefixIcon,
      this.textAlign,
      this.textErrRequire,
      this.name,
      this.autoFocus,
      this.onChange,
      this.focusNode,
      this.validate,
      this.hintText,
      this.disable,
      this.styleInput = StyleInput.underline,
      this.isRequire = false,
      this.textEditingController,
      this.labelText})
      : typeInput = TypeInput.number,
        super(key: key);

  AppInput.decimal(
      {Key? key,
      this.isCenter = false,
      this.unShowStar,
      this.prefixIcon,
      this.autoFocus,
      this.focusNode,
      this.textAlign,
      this.textErrRequire,
      this.name,
      this.onChange,
      this.validate,
      this.hintText,
      this.disable,
      this.styleInput = StyleInput.underline,
      this.isRequire = false,
      this.textEditingController,
      this.formatters,
      this.labelText})
      : typeInput = TypeInput.decimal,
        super(key: key);

  AppInput.date(
      {Key? key,
      this.onChangeDate,
      this.disable,
      this.textAlign,
      this.textEditingController,
      this.styleInput = StyleInput.underline,
      this.validate,
      // this.fromDate,
      // this.endDate,
      this.isCenter = false,
      // this.initDate,
      this.textErrRequire,
      this.name,
      this.dataDate,
      this.isRequire = false,
      this.formatters,
      this.labelText})
      : typeInput = TypeInput.date,
        super(key: key);

  AppInput.dateRange(
      {Key? key,
      this.styleInput = StyleInput.underline,
      this.validate,
      this.textAlign,
      this.disable,
      this.textErrRequire,
      this.isCenter = false,
      this.name,
      this.dataDate,
      this.isRequire = false,
      this.labelText})
      : typeInput = TypeInput.dateRange,
        super(key: key);

  AppInput.birthDate(
      {Key? key,
      this.hintText,
      this.textAlign,
      this.disable,
      this.unShowStar,
      this.textErrRequire,
      this.isCenter = false,
      this.name,
      this.textEditingController,
      this.styleInput = StyleInput.underline,
      this.validate,
      this.dataDate,
      this.isRequire = false,
      this.labelText})
      : typeInput = TypeInput.birthDate,
        super(key: key);

  AppInput.locate(
      {Key? key,
      this.labelText,
      this.labelWidget,
      this.textAlign,
      this.isCenter = false,
      this.onChange,
      this.disable,
      this.textErrRequire,
      this.name,
      this.textEditingController,
      this.validate,
      this.styleInput = StyleInput.underline,
      this.listData,
      this.isRequire = false})
      : typeInput = TypeInput.locate,
        super(key: key);

  AppInput.textArea(
      {Key? key,
      this.validate,
      this.textErrRequire,
      this.name,
      this.autoFocus,
      this.focusNode,
      this.isCenter = false,
      this.textAlign,
      this.hintText,
      this.styleInput = StyleInput.underline,
      this.isRequire = false,
      this.textEditingController,
      this.labelText,
      required this.maxLine})
      : typeInput = TypeInput.textArea,
        super(key: key);

  @override
  State<AppInput> createState() => AppInputState();
}

class AppInputState extends State<AppInput> {
  late TextEditingController _controller;
  final GlobalKey<TextInputDateState> _keyDate = GlobalKey<TextInputDateState>();
  final GlobalKey<TextInputBirthDateState> _keyBirthDate = GlobalKey<TextInputBirthDateState>();
  String get value => _controller.text;

  /// chi app dung cho dateTime, birthDay
  // HaloDateTime? get valueDate => _keyDate.currentState?.valueDate();
  // HaloDateTime? get valueBirthDay => _keyBirthDate.currentState?.valueDate();

  @override
  void initState() {
    _controller = widget.textEditingController ?? TextEditingController();
    super.initState();
  }

  Text hintText() => Text.rich(TextSpan(children: [
        TextSpan(
          text: widget.labelText,
          style: context.labelLarge,
        ),
        widget.isRequire == true && widget.unShowStar != true
            ? TextSpan(
                text: '*',
                style: context.bodyLarge?.notice,
              )
            : const TextSpan(text: '')
      ]));

  @override
  Widget build(BuildContext context) {
    final String? lableText = widget.labelText ?? (widget.labelWidget != null ? null : "");
    InputDecoration inputDecoration = widget.styleInput == StyleInput.underline
        ? InputDecoration(
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.only(left: 0),
            label: widget.isCenter == false
                ? (lableText != null
                    ? Text.rich(TextSpan(text: lableText, children: [
                        widget.isRequire == true && widget.unShowStar != true
                            ? const TextSpan(
                                text: " (*)",
                              )
                            : const TextSpan(text: "")
                      ]))
                    : widget.labelWidget)
                : Center(
                    child: (lableText != null
                        ? Text.rich(TextSpan(text: lableText, children: [
                            widget.isRequire == true && widget.unShowStar != true
                                ? const TextSpan(
                                    text: "(*)",
                                  )
                                : const TextSpan(text: "")
                          ]))
                        : widget.labelWidget),
                  ),
            labelStyle: (widget.disable == true) ? context.bodyMedium?.disable : null,
            hintText: widget.hintText,
            hintStyle: (widget.disable == true) ? context.bodyMedium?.disable : null,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: context.outlineColor),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.red),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.red),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.outlineColor),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.outlineColor.withOpacity(0.4)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.primaryColor),
            ),
            errorMaxLines: widget.errorMaxLines,
            prefixIcon: widget.prefixIcon,
          )
        : InputDecoration(
            contentPadding: EdgeInsets.only(
                right: 0, left: 16, top: widget.typeInput == TypeInput.textArea ? 16 : 0),
            labelStyle: (widget.disable == true) ? context.bodySmall?.disable : null,
            floatingLabelStyle: Theme.of(context).inputDecorationTheme.floatingLabelStyle,
            alignLabelWithHint: true,
            floatingLabelAlignment: widget.isCenter == true ? FloatingLabelAlignment.center : null,
            label: (widget.labelText != null
                ? Text.rich(TextSpan(children: [
                    TextSpan(
                      text: widget.labelText,
                    ),
                    widget.isRequire == true && widget.unShowStar != true
                        ? const TextSpan(
                            text: ' (*)',
                          )
                        : const TextSpan(text: '')
                  ]))
                : widget.labelWidget),
            errorStyle: const TextStyle(fontSize: 10, height: 0),
            hintStyle:
                (widget.disable == true) ? context.bodyMedium?.disable : context.inputFieldHint,
            hintText: widget.hintText,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            filled: false,
            focusedErrorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
            border: Theme.of(context).inputDecorationTheme.border,
            errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
            disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
            errorMaxLines: widget.errorMaxLines,
            prefixIcon: widget.prefixIcon,
          );

    switch (widget.typeInput) {
      case TypeInput.password:
        return TextInputPassword(
          disable: widget.disable,
          textAlign: widget.isCenter == true ? TextAlign.center : widget.textAlign,
          textErrRequire: widget.textErrRequire,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          showPassword: widget.showPassword,
          controller: _controller,
          autoFocus: widget.autoFocus ?? false,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
        );
      case TypeInput.text:
        return TextInputText(
          autoFocus: widget.autoFocus,
          focusNode: widget.focusNode,
          disable: widget.disable,
          textAlign: widget.isCenter == true ? TextAlign.center : widget.textAlign,
          textErrRequire: widget.textErrRequire,
          onChange: widget.onChange,
          controller: _controller,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
        );
      case TypeInput.date:
        return TextInputDate(
          disable: widget.disable,
          textAlign: widget.isCenter == true ? TextAlign.center : widget.textAlign,
          onChange: widget.onChangeDate,
          // fromDate: widget.fromDate,
          // endDate: widget.endDate,
          // initDate: widget.initDate,
          textErrRequire: widget.textErrRequire,
          key: _keyDate,
          styleInput: widget.styleInput,
          controller: _controller,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
        );
      case TypeInput.locate:
        return TextInputLocate(
          disable: widget.disable,
          textAlign: widget.isCenter == true ? TextAlign.center : widget.textAlign,
          textErrRequire: widget.textErrRequire,
          validate: widget.validate,
          controller: _controller,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
        );
      case TypeInput.birthDate:
        return TextInputBirthDate(
          disable: widget.disable,
          textAlign: widget.isCenter == true ? TextAlign.center : widget.textAlign,
          key: _keyBirthDate,
          textErrRequire: widget.textErrRequire,
          controller: _controller,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
        );
      case TypeInput.textArea:
        return TextInputTextArea(
          autoFocus: widget.autoFocus,
          focusNode: widget.focusNode,
          disable: widget.disable,
          textErrRequire: widget.textErrRequire,
          controller: _controller,
          maxLine: widget.maxLine,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
        );
      case TypeInput.number:
        return TextInputText(
          autoFocus: widget.autoFocus,
          focusNode: widget.focusNode,
          textAlign: widget.isCenter == true ? TextAlign.center : widget.textAlign,
          textErrRequire: widget.textErrRequire,
          disable: widget.disable,
          onChange: widget.onChange,
          controller: _controller,
          isNumber: true,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
        );
      case TypeInput.decimal:
        return TextInputText(
          autoFocus: widget.autoFocus,
          focusNode: widget.focusNode,
          textAlign: widget.isCenter == true ? TextAlign.center : widget.textAlign,
          textErrRequire: widget.textErrRequire,
          disable: widget.disable,
          onChange: widget.onChange,
          controller: _controller,
          isNumber: true,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
          formatters: [...?widget.formatters],
        );

      ///todo: chua hoan thanh(pedding: khi nao dung moi lam)
      case TypeInput.dateRange:
        return TextInputDateRange(
          textErrRequire: widget.textErrRequire,
          validate: widget.validate,
          inputDecoration: inputDecoration,
          isRequire: widget.isRequire,
        );
    }
  }
}
