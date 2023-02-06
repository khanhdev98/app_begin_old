import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TourAssetPaths {
  TourAssetPaths._();
  static const String tourPackage = "packages/theme/assets/images/tour/";
  static const String _package = "packages/theme/assets/images/";

  /// Icons tour
  static const String icDiscount = tourPackage + "ic_discount.png";
  static const String icPercentDiscount = tourPackage + "ic_percent_discount.png";
  static const String icLogoHalo = tourPackage + 'ic_logo_hahalolo.png';
  static const String icDialogErrorFill = tourPackage + 'ic_dialog_error_fill.png';
  static const String icDialogSuccessFill = tourPackage + 'ic_success_dialog.png';
  static const String icBusiness = tourPackage + 'ic_business.png';
  static const String icFlag = tourPackage + 'ic_flag_outline.png';
  static const String icCoupleArrowRight = tourPackage + "ic_double_arrow_right.png";
  static const String icIconTitle = tourPackage + "ic_title.png";
  static const String icTickGreen = tourPackage + "ic_tick_green.png";
  static const String icTickLocate = tourPackage + "ic_pin_tick.png";
  static const String icCrossLocate = tourPackage + "ic_cross_hair.png";
  static const String icGetGallery = tourPackage + "ic_get_galery.png";
  static const String icDotLine = tourPackage + "ic_tour_dot_line.png";
  static const String icStarRate = tourPackage + "ic_star_rate.png";
  static vehicles(String name) {
    return  _package + name.toLowerCase() + "Vehicle.png";
  }

  /// Images tour
  static const String imgTourBookingLoading = tourPackage + "img_tour_booking_loading.png";
  static const String imgVoucherEmpty = tourPackage + "ic_empty_voucher.png";
  static const String imgInfoEmpty = tourPackage + "ic_info_empty_tour_detail.png";
  static const String imgHaloName = tourPackage + "img_holder_halo.png";
  static const String imgEmptyPlace = tourPackage + "ic_empty_place.png";
  static const String imgPromoPercent = tourPackage + "ic_promo_percent.png";
  static const String imgInstallment = tourPackage + "ic_tour_seperate.png";
  static const String imgEmpty = tourPackage + "img_empty.png";
  static const String imgEmptyHandNote = tourPackage + "img_empty_order_hand_note.png";
  static const String icInstallmentTour = tourPackage + "ic_installment_tour.png";

}

class ServiceTourIcons {
  ServiceTourIcons._();

  static const String _fontFamily = "ServiceTourFont";

  static const IconData accommodation = IconData(0xe900, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData bookingAssist = IconData(0xe901, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData dining = IconData(0xe902, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData entertainment = IconData(0xe903, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData equipment = IconData(0xe904, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData gift = IconData(0xe905, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData guide = IconData(0xe906, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData icDefault = IconData(0xe907, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData insurance = IconData(0xe908, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData shuttling = IconData(0xe909, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData sim = IconData(0xe90a, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData ticket = IconData(0xe90b, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData tips = IconData(0xe90c, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData towel = IconData(0xe90d, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData transport = IconData(0xe90e, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData visa = IconData(0xe90f, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData water = IconData(0xe910, fontFamily: _fontFamily, fontPackage: "theme");
  static const IconData wifi = IconData(0xe911, fontFamily: _fontFamily, fontPackage: "theme");
}