import 'package:content/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget/extensions/collection_extention.dart';
import 'package:widget/flutter_easyloading-3.0.5/lib/src/easy_loading.dart';
import 'package:theme/material3/m3_theme_lib.dart';
import 'package:widget/di/auth_router.dart';

import '../focus_bloc_cubit.dart';
import '../language_select.dart';
import '../text_input/app_input.dart';
import '../validate/validate.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerAcc = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  FocusBlocCubit get focusBlocCubit => context.read();

  FocusNode? get focusEmail => focusBlocCubit.focusNodes.getOrNull(0);

  FocusNode? get focusPassword => focusBlocCubit.focusNodes.getOrNull(1);
  final List<Map<String, String>> users = [
    {
      "id": "1",
      "acc": "khanh@gmail.com",
      "pass": "123456",
    },
    {
      "id": "2",
      "acc": "minh@gmail.com",
      "pass": "123456",
    },
    {
      "id": "3",
      "acc": "huy@gmail.com",
      "pass": "123456",
    },
    {
      "id": "4",
      "acc": "nam@gmail.com",
      "pass": "123456",
    },
  ];

  Iterable<String?> get accounts => users.map((value) => value["acc"]);

  Iterable<String?> get passwords => users.map((value) => value["pass"]);

  _loginSubmit() {
    if (_formKey.currentState?.validate() == true) {
      if (mounted) {
        EasyLoading.show();
        Future.delayed(const Duration(milliseconds: 1000), () {
          EasyLoading.dismiss();
        }).then((value) {
          if (accounts.contains(_controllerAcc.text) && passwords.contains(_controllerPass.text)) {
            Navigator.pushNamed(context, AppCommon.todoScreen).then((value) {
                _controllerAcc.clear();
                _controllerPass.clear();
                setState(() {

                });
            });

          } else {
            return showDialog(
                context: context,
                builder: (_) => WillPopScope(
                      onWillPop: () async => false,
                      child: AlertDialog(
                        contentPadding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                        actionsPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        alignment: Alignment.center,
                        backgroundColor: context.surfaceColor,
                        title: Text(
                          Str.of(context).error_unauthorized_title,
                          style: context.dialogTitle,
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(Str.of(context).sign_in_error_login_message),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              //onButtonPressed();
                            },
                            child: const Text(
                              "try again",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ));
          }
        });
      }
    }
  }
  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surfaceColor,
      appBar: AppBar(
        elevation: 3,
        title: Text(Str.of(context).sign_in),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppInput.text(
                        unShowStar: true,
                        validate: (value) {
                          return AuthValidate.validateEmail(value, context);
                        },
                        focusNode: focusEmail,
                        isRequire: true,
                        textEditingController: _controllerAcc,
                        labelText: Str.of(context).sign_enter_email_or_number,
                        textErrRequire: Str.of(context).validate_email_require,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput.password(
                        validate: (value) {
                          return AuthValidate.validatePassword(value, context);
                        },
                        showPassword: true,
                        focusNode: focusPassword,
                        textEditingController: _controllerPass,
                        labelText: Str.of(context).sign_enter_password,
                        textErrRequire: Str.of(context).validate_email_require,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () => _loginSubmit(),
                child: Text(Str.of(context).sign_in),
              ),
              const LanguageSelect(
                isSignIn: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
