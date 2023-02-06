import 'package:widget/extensions/regex_extension.dart';

/// hcajksdhfaiusdffhasdfasd
/// askdjhfjkahsdkfjhasdlfkjhsadf
bool isValidSignInForm(String value) => value.isEmail() || value.isPhone();

///
