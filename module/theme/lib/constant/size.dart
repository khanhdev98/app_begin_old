import 'package:flutter/cupertino.dart';

///[TextStyle]
/// NAME         SIZE  WEIGHT  SPACING
/// headline1    29.0  light   -1.5
/// headline2    25.0  light   -0.5
/// headline3    23.0  regular  0.0
/// headline4    19.0  regular  0.25
/// headline5    17.0  regular  0.0
/// headline6    16.0  medium   0.15
/// subtitle1    15.0  regular  0.15
/// subtitle2    13.0  medium   0.1
/// body1        15.0  regular  0.5   (bodyText1)
/// body2        13.0  regular  0.25  (bodyText2)
/// button       15.0  medium   1.25
/// caption      13.0  regular  0.4
/// overline     10.0  regular  1.5

/// It's a class that contains all the text and icon sizes used in the app
class HaloSize {
  HaloSize._();

  /// text size
  static const double textH1 = 29;
  static const double textH2 = 25;
  static const double textH3 = 23;
  static const double textH4 = 19;
  static const double textH5 = 17;
  static const double textH6 = 16;
  static const double textSub1 = 14;
  static const double textSub2 = 14;
  static const double textBody1 = 16;
  static const double textBody2 = 15;
  static const double textVerySmall = 10;
  static const double textCaption = 12;
  static const double textNormal = 15;
  static const double textSemiLarge = 17;
  static const double textLarge = 19;
  /// icon size
  static const double iconMedium = 24;
  static const double iconLargeMedium = 36;
}

/// Space
/// A class that defines the space of the button.
class HaloButtonSpace {
  HaloButtonSpace._();
  /// btn
  static const double smallMaxHeight = 40;
  static const double semiSmallMaxHeight = 44;
  static const double fullFillMaxHeight = 50;
  static const double paddingHorizontal = 5;
  static const double paddingVertical = 5;
  static const double circular = 32;
  static const double maxHeight = 40;
  static const double minWidth = 138;
}


/// Space/// > This class is used to define the spacing between elements in the app
class HaloSpace {
  HaloSpace._();

  ///super small size
  static const double smallS = 4;

  ///Small size
  static const double small = 8;
  static const double normal = 16;
  static const double normalS = 20;
  static const double large = 24;
  static const double largeS = 32;
  static const double veryLarge = 38;
  static const double veryLargeS = 50;
}
