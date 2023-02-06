import 'package:content/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:widget/flutter_easyloading-3.0.5/lib/src/easy_loading.dart';
import 'package:provider/provider.dart' as provider;
import 'package:theme/material3/m3_theme_lib.dart';
import 'di/auth_router.dart';
import 'location_provider.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({Key? key, this.isSignIn}) : super(key: key);
  final bool? isSignIn;

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  @override
  Widget build(BuildContext context) {
    return provider.Consumer<LocaleProvider>(builder: (context, provider, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(LocaleProvider.getLanguageName(L10n.I.en.languageCode),
                      style: provider.languageCodeLocale == (L10n.I.en.languageCode)
                          ? context.labelLarge?.primary
                          : context.labelLarge),
                  onPressed: () => onPressed(context, provider, L10n.I.en.languageCode),
                ),
              ],
            ),
          ),
          HaloSpacing.xSmall,
          Container(
            color: context.outlineColor,
            width: 2,
            height: 16,
          ),
          HaloSpacing.xSmall,
          Expanded(
            child: Row(
              children: [
                TextButton(
                  child: Text(
                    LocaleProvider.getLanguageName(L10n.I.vi.languageCode),
                    style: provider.languageCodeLocale == L10n.I.vi.languageCode
                        ? context.labelLarge?.primary
                        : context.labelLarge,
                  ),
                  onPressed: () => onPressed(context, provider, L10n.I.vi.languageCode),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  ///todo thực hiện place với route hiện tại
  void onPressed(BuildContext context, LocaleProvider provider, String languageCode) {
    print('khanhtran ');
    //fake loading ....
    EasyLoading.show();
    Future.delayed(const Duration(milliseconds: 2000), () {
      EasyLoading.dismiss();
    }).then((value) {
      Navigator.of(context)
          .pushReplacementNamed(AppCommon.home);
      provider.setLanguageCode(languageCode);
    });
  }
}
