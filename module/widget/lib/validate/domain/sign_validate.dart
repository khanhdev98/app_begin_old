
import 'package:widget/extensions/regex_extension.dart';

bool isEmailOrPhone(String value) => value.isEmail() || value.isPhone();

bool isPassword(String value) => value.isPasswordEasy();

bool isLastName(String value) => value.isSpecialCharacter();

bool isEmail(String value) => value.isEmail();