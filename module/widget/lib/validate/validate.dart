import 'package:content/content.dart';
import 'package:flutter/cupertino.dart';

import 'domain/sign_validate.dart';

class AuthValidate {
  static String? validatePassword(String? value, BuildContext context) {
    ///todo: validate.
    String newString = value ?? "";
    if(newString.length < 6) {
      return Str.of(context).sign_up_password_length_error;
    }else if(newString.length > 128) {
      return Str.of(context).sign_up_password_length_more_128_error;
    }
    return null;
  }

  static String? validatePasswordConfirm(String? value, BuildContext context, String? compare) {
    String newString = value ?? "";
    String newStringCompare = compare ?? "";

    if(newString != newStringCompare) {
      return Str.of(context).validate_confirm_password;
    }
    return null;
  }

  static String? validateFirstName(String? value, BuildContext context) {
    String newString = value ?? "";
    newString = newString.trim();
    if(isLastName(newString)) {
      return Str.of(context).sign_up_first_name_Invalid_error;
    }
    return null;
  }

  static String? validateLastName(String? value, BuildContext context) {
    String newString = value ?? "";
    newString = newString.trim();
    if(isLastName(newString)) {
      return Str.of(context).sign_up_last_name_Invalid_error;
    }
    return null;
  }

  static String? validateEmailOrPhone(String? value, BuildContext context) {
    String newString = value ?? "";
    newString = newString.trim().toLowerCase();
    if(!isEmailOrPhone(newString)) {
      return Str.of(context).validate_format;
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context){
    String newString = value ?? "";
    newString = newString.trim();

    if(!isEmail(newString)) {
      return Str.of(context).validate_format_email;
    }
    return null;
  }
}
