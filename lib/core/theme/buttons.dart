import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/core/theme/colors.dart';
import 'package:dodohan/core/theme/paddings.dart';

import 'fonts.dart';

class BtStyle {
  BtStyle._();

  static ButtonStyle standard({Color? color = ThemeColors.main, double? height}) => ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        textStyle: ThemeFonts.medium.getTextStyle(size: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(Get.width, height ?? 54));

  static ButtonStyle get confirm => TextButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.transparent,
    // surfaceTintColor: Colors.transparent,
    elevation: 0,
    textStyle: ThemeFonts.medium.getTextStyle(),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(33),
        side: const BorderSide(width: 1.5, color: ThemeColors.mainLightest)),
    minimumSize: Size(Get.width, 54)
  );

  // static ButtonStyle get confirm => standard.copyWith(
  //       backgroundColor: MaterialStateProperty.all(Colors.white),
  //       elevation: MaterialStateProperty.all(0),
  //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(33),
  //           side: const BorderSide(width: 1.5, color: ThemeColors.mainLightest))),
  //     );

  // static ButtonStyle get loginBy => standard().copyWith(
  //   shape: MaterialStateProperty.all(
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
  //   elevation: MaterialStateProperty.all(4),
  //   backgroundColor: MaterialStateProperty.all(Colors.white),
  //   surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
  //   overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
  // );

  static ButtonStyle get loginBy => ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    textStyle: ThemeFonts.medium.getTextStyle(),
    surfaceTintColor: Colors.transparent,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    minimumSize: Size(Get.width, 54),
  );

  static ButtonStyle onOff(bool isOn) => ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            Size(Get.width - ThemePaddings.mainPadding * 2, 54)),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (isOn) return ThemeColors.main;
          return ThemeColors.grayDark;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (isOn) return ThemeColors.main.withOpacity(0.1);
          return Colors.white.withOpacity(0.1);
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (isOn) return ThemeColors.main;
          return ThemeColors.grayDark;
        }),
        textStyle: MaterialStateProperty.all(ThemeFonts.medium.getTextStyle(size: 16)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      );
}
