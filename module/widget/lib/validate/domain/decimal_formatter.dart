import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

///todo: fix issue.
/// issue 2: chưa handle hết trường hợp người dùng đột nhiên thêm kí tự thập phân ở bất kì chỗ nào
/// trên text mới.

ReturnType run<ReturnType>(ReturnType Function() operation) {
  return operation();
}

extension ScopeFunctionsForObject<T> on T {
  ReturnType let<ReturnType>(ReturnType Function(T self) operationFor) {
    return operationFor(this);
  }

  T also(void Function(T self) operationFor) {
    operationFor(this);
    return this;
  }
}

class DecemberTextInputFormatter extends TextInputFormatter {
  final String srcLocale;
  final String targetLocale;
  DecemberTextInputFormatter({
    required this.srcLocale,
    required this.targetLocale,
  });
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final input = NumberFormat.currency(name: '', locale: srcLocale);
    final output = NumberFormat.currency(locale: targetLocale)
        .let((self) => self.maximumFractionDigits)
        .let((maximumFractionDigits) => NumberFormat.currency(
            name: '', locale: targetLocale, decimalDigits: maximumFractionDigits));

    double test = 1.69;
    String textCate = output.format(test);

    /// phân loại tiền làm tròn về số nguyên (vd VN) và tiền làm tròn về 2 số thập phân(vd USD).
    /// nếu textCate chứa kí tự thập phân => tiền làm tròn về 2 số thập phân
    /// ngược lại, tiền làm tròn về số nguyên
    if (textCate.contains(output.symbols.DECIMAL_SEP)) {
      ///chặn các kí tự " " và "-".
      if (newValue.text.contains(" ") || newValue.text.contains("-")) {
        return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(offset: oldValue.selection.extent.offset),
        );
      }

      ///  khởi tạo biến result, result là giá trị cuối cùng nhận được để show.
      String result = "";
      String newText = newValue.text.trim().replaceAll(" ", "");
      String oldText = oldValue.text.trim().replaceAll(" ", "");

      /// chuyển đổi lại ngôn ngữ để handle cho text vừa nhập.
      newText = ReplaceLocate(input.symbols.DECIMAL_SEP, input.symbols.GROUP_SEP,
          output.symbols.DECIMAL_SEP, output.symbols.GROUP_SEP, newText);

      /// khỏi tạo con trỏ.
      int cursorPosition = 0;

      /// chỉ định con trỏ lùi về 1 vị trí khi người dùng xóa 1 kí tự trong text.
      /// ngược lại, tiến 1 vị trí.
      if (oldText.length > newText.length) {
        cursorPosition = -1;
      } else {
        cursorPosition = 1;
      }

      /// handle người dùng nhập kí tự đầu tiên.
      if (oldText.isEmpty) {
        /// kí tự đầu tiên là kí tự thập phân.
        if (newText == "," || newText == ".") {
          result = "0${output.symbols.DECIMAL_SEP}";
          cursorPosition = 2;
        }

        /// kí tự đầu tiên là số.
        else {
          result = newText;
        }
      }

      ///Handle người dùng nhập các kí tự tiếp theo.
      else {
        /// Kiểm tra text đã có kí tự thập phân hay chưa.
        /// Nếu có rồi, ko cho người dùng thêm dấu => trả về text cũ.
        /// nếu chưa có handle else.
        if ((newText.lastIndexOf(output.symbols.DECIMAL_SEP) !=
            newText.indexOf(output.symbols.DECIMAL_SEP))) {
          result = oldText;
          cursorPosition = 0;
        } else {
          /// handle người dùng bắt đầu nhập ở kí tự cuối cùng.
          /// nếu kí tự cuối dùng là dấu thập phân.
          /// ngược lại là số.
          if (newValue.text[newText.length - 1] == "," ||
              newValue.text[newText.length - 1] == ".") {
            ///chặn người dùng nhập liên tiếp 2 dấu thập phân.
            if (newValue.text[newText.length - 2] == "," ||
                newValue.text[newText.length - 2] == ".") {
              result = oldText;
              cursorPosition = 0;
            } else {

              ///thay dấu bất kì dấu "," hay "." thành dấu thập phân khi text ko chua bat ki .
              if(newText.contains(output.symbols.DECIMAL_SEP) == false){
                result = "${newText.substring(0, newText.length - 1)}${output.symbols.DECIMAL_SEP}";
              }else{
                result = newText.substring(0, newText.length - 1);
              }

              /// chuyển đổi ngôn ngữ để show.
              result = ReplaceLocate(output.symbols.DECIMAL_SEP, output.symbols.GROUP_SEP,
                  input.symbols.DECIMAL_SEP, input.symbols.GROUP_SEP, result);
            }
          } else {
            try {
              ///handle trường hợp đã đủ 2 số sau thập phân nhưng người dùng vẫn nhập
              if (newText.contains(output.symbols.DECIMAL_SEP) &&
                  newText.length >= 4 &&
                  newText.indexOf(output.symbols.DECIMAL_SEP) <= newText.length - 4) {
                //result = oldText;
                //cursorPosition = 0;
                ///Trim còn chỉ còn 2 kí tự ở sau dấu thập phân.
                ///start fix: 19/01/2023
                result = output.format(output.parse(newText));

                result = result.replaceAll(output.symbols.GROUP_SEP, "");
                newText = newText.replaceAll(output.symbols.GROUP_SEP, "");
                while (newText.length != result.length) {
                  newText = newText.substring(0, newText.length - 1);
                }

                result = output.format(output.parse(newText));


                result = ReplaceLocate(output.symbols.DECIMAL_SEP, output.symbols.GROUP_SEP,
                    input.symbols.DECIMAL_SEP, input.symbols.GROUP_SEP, result);

                if (result.length == oldText.length) {
                  cursorPosition = 1;
                } else {
                  cursorPosition = 0;
                }

                ///end fix: 19/01/2023
              } else {
                print("newText: $newText");

                /// handle các trường hợp đặc biệt.
                late String newResult;

                /// nếu người dùng nhập số thập phân đầu tiên là 0 thì giữ lại
                if (newText.substring(newText.length - 2, newText.length) == ".0" ||
                    newText.substring(newText.length - 2, newText.length) == ",0") {
                  newResult = output.format(output.parse(newText));

                  /// trim số 00 trong trường hợp: ví dụ 5.00 => 5
                  if (newResult.substring(newResult.length - 3, newResult.length) ==
                      "${output.symbols.DECIMAL_SEP}00") {
                    result = newResult.substring(0, newResult.length - 3);
                  } else if (newResult.contains(output.symbols.DECIMAL_SEP) &&
                      newResult[newResult.length - 1] == "0") {
                    /// trim số 00 trong trường hợp: ví dụ 5.60 => 5.6
                    result = newResult.substring(0, newResult.length - 1);
                  } else {
                    if (newResult.length == oldText.length) {
                      cursorPosition = 0;
                    }
                    result = newResult;
                  }
                  result = "$result${output.symbols.DECIMAL_SEP}0";
                } else {
                  newResult = output.format(output.parse(newText));
                  print("newResult: $newResult");
                  /// trim số 00 trong trường hợp: ví dụ 5.00 => 5
                  if (newResult.substring(newResult.length - 3, newResult.length) ==
                      "${output.symbols.DECIMAL_SEP}00") {
                    result = newResult.substring(0, newResult.length - 3);
                  } else if (newResult.contains(output.symbols.DECIMAL_SEP) &&
                      newResult[newResult.length - 1] == "0") {
                    /// trim số 00 trong trường hợp: ví dụ 5.60 => 5.6
                    result = newResult.substring(0, newResult.length - 1);
                  } else {
                    if (newResult.length == oldText.length) {
                      cursorPosition = 0;
                    }
                    result = newResult;
                  }
                }

                result = ReplaceLocate(output.symbols.DECIMAL_SEP, output.symbols.GROUP_SEP,
                    input.symbols.DECIMAL_SEP, input.symbols.GROUP_SEP, result);
              }
            } catch (e) {
              print("err");
              result = newText;
            }
          }
        }
      }
      final cur = oldValue.selection.extent.offset +
          cursorPosition +
          (input.symbols.GROUP_SEP.allMatches(result).length -
              input.symbols.GROUP_SEP.allMatches(oldText).length);
      return TextEditingValue(
        text: result,
        selection: TextSelection.collapsed(offset: result.length < cur ? result.length : cur),
      );
    } else {
      if (newValue.text.contains(" ") ||
          newValue.text.contains("-") ||
          newValue.text.contains(input.symbols.DECIMAL_SEP)) {
        return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(offset: oldValue.selection.extent.offset),
        );
      }
      String result = "";
      String newText = newValue.text.trim().replaceAll(" ", "");
      String oldText = oldValue.text.trim().replaceAll(" ", "");
      newText = ReplaceLocate(input.symbols.DECIMAL_SEP, input.symbols.GROUP_SEP,
          output.symbols.DECIMAL_SEP, output.symbols.GROUP_SEP, newText);

      int cursorPosition = 0;
      if (oldText.length > newText.length) {
        cursorPosition = -1;
      } else {
        cursorPosition = 1;
      }

      ///nhap dau tien
      if (oldText.isEmpty) {
        /// ki tu dau tien la dau thap phan
        if (newText == "," || newText == ".") {
          result = "0";
          cursorPosition = 1;
        }

        /// ki tu dau tien la so
        else {
          result = newText;
        }
      }

      ///Nhap cac so tiep theo
      else {
        try {
          String newResult = output.format(output.parse(newText)).trim();
          if (newResult.length == oldText.length) {
            cursorPosition = 0;
          }
          result = newResult;
          result = ReplaceLocate(output.symbols.DECIMAL_SEP, output.symbols.GROUP_SEP,
              input.symbols.DECIMAL_SEP, input.symbols.GROUP_SEP, result);
        } catch (e) {
          print("err");
          result = newText;
        }
      }

      final cur = oldValue.selection.extent.offset +
          cursorPosition +
          (input.symbols.GROUP_SEP.allMatches(result).length -
              input.symbols.GROUP_SEP.allMatches(oldText).length);
      return TextEditingValue(
        text: result,
        selection: TextSelection.collapsed(offset: result.length < cur ? result.length : cur),
      );
    }
  }
}

String ReplaceLocate(String srcD, String srcG, String tarD, String tarG, String value) {
  String newValue = value.replaceAll(srcD, "!");
  newValue = newValue.replaceAll(srcG, tarG);
  newValue = newValue.replaceAll('!', tarD);
  return newValue;
}

