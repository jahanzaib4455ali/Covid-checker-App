import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/service/di.dart';

import 'my_colors.dart';

final myTextStyle = getIt.get<TextStyleCustom>();

class TextStyleCustom extends TextTheme {
  final TextStyle _textStyle = const TextStyle(
    fontFamily: "Plus Jakarta Sans",
    color: MyColors.dark000000,
  );

  @override
  TextStyle get titleLarge => _textStyle;

  ///48 font family (Main Heading)
  TextStyle get font_48wMedium =>
      titleLarge.copyWith(fontWeight: FontWeight.w500, fontSize: 48.h);

  ///39 font family (Main Heading)
  TextStyle get font_39wMedium =>
      titleLarge.copyWith(fontWeight: FontWeight.w500, fontSize: 39.h);

  TextStyle get font_32w500 =>
      titleLarge.copyWith(fontWeight: FontWeight.w500, fontSize: 32.h);

  ///30 font family (Main Heading)
  TextStyle get font_30w700 =>
      titleLarge.copyWith(fontWeight: FontWeight.w700, fontSize: 30.h);

  ///25 font family (Main Heading)
  TextStyle get font_25wRegular => titleLarge.copyWith(fontSize: 25.h);

  ///20 font family (Main Heading)
  TextStyle get font_20wMedium =>
      titleLarge.copyWith(fontWeight: FontWeight.w700, fontSize: 20.h);

  ///32 font family (Main Heading)
  TextStyle get font_32w700 =>
      titleLarge.copyWith(fontWeight: FontWeight.w700, fontSize: 32.h);

  ///13 font family (Button Text)
  TextStyle get font_13w700 =>
      titleLarge.copyWith(fontWeight: FontWeight.w700, fontSize: 13.h);
  TextStyle get font_13w700Black => titleLarge.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 13.h,
      );

  TextStyle get font_12w400 =>
      titleLarge.copyWith(fontWeight: FontWeight.w400, fontSize: 12.h);

  TextStyle get font_13w300 =>
      titleLarge.copyWith(fontWeight: FontWeight.w300, fontSize: 13.h);
  TextStyle get font_13w300Black =>
      titleLarge.copyWith(fontWeight: FontWeight.w300, fontSize: 13.h);

  TextStyle get font_12w500Black =>
      titleLarge.copyWith(fontWeight: FontWeight.w500, fontSize: 12.h);
  TextStyle get font_12w500 =>
      titleLarge.copyWith(fontWeight: FontWeight.w500, fontSize: 12.h);
  TextStyle get font_12w700 =>
      titleLarge.copyWith(fontWeight: FontWeight.w700, fontSize: 12.h);

  ///16 font family (Button Text)
  TextStyle get font_16ww400 =>
      titleLarge.copyWith(fontSize: 18.h, fontWeight: FontWeight.w400);
  TextStyle get font_16ww500 =>
      titleLarge.copyWith(fontSize: 18.h, fontWeight: FontWeight.w500);
  TextStyle get font_16ww700 =>
      titleLarge.copyWith(fontSize: 16.h, fontWeight: FontWeight.w700);

  ///18 font family (Button Text)
  TextStyle get font_18w600 =>
      titleLarge.copyWith(fontSize: 18.h, fontWeight: FontWeight.w600);
  TextStyle get font_18w500 =>
      titleLarge.copyWith(fontSize: 18.h, fontWeight: FontWeight.w500);

  ///14 font family (Button Text)
  TextStyle get font_14w400 =>
      titleLarge.copyWith(fontWeight: FontWeight.w400, fontSize: 18.h);
  TextStyle get font_14w500 => titleLarge.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18.h,
      );


  TextStyle get font_14w600 => titleLarge.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 14.h,
  );

  TextStyle get font_10w500 =>
      titleLarge.copyWith(fontWeight: FontWeight.w500, fontSize: 10.h);
  TextStyle get font_10w400 => titleLarge.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 10.h,
      );

  TextStyle get font_20w600 =>
      titleLarge.copyWith(fontWeight: FontWeight.w600, fontSize: 20.h);

  TextStyle get font_16ww600 =>
      titleLarge.copyWith(fontWeight: FontWeight.w600, fontSize: 16.h);

  TextStyle get font_12w600 =>
      titleLarge.copyWith(fontWeight: FontWeight.w600, fontSize: 12.h);
}
