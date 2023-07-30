import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/core/theme/colors.dart';
import 'package:stamp_now/core/theme/paddings.dart';

class BtStyle {
  BtStyle._();

  static ButtonStyle get textDialog => TextButton.styleFrom(
    foregroundColor: ThemeColors.main,
    side: const BorderSide(color: ThemeColors.main, width: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    elevation: 0,
    minimumSize: Size(Get.width * 0.55, 54),
  );

  static ButtonStyle get splash => ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.05)),
      minimumSize: MaterialStateProperty.all(const Size(0, 46)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));

  static ButtonStyle get start => ButtonStyle(

    foregroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(Colors.white10),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return Colors.grey;
          return ThemeColors.main;
        }),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    minimumSize: MaterialStateProperty.all(const Size(80, 48)),
    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
  );

  static ButtonStyle get standard => start.copyWith(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    minimumSize: MaterialStateProperty.all(Size(Get.width - ThemePaddings.mainPadding * 2, 54)),
  );

  static ButtonStyle get info => standard.copyWith(
    backgroundColor: MaterialStateProperty.all(ThemeColors.mainLight),
    minimumSize: MaterialStateProperty.all(Size(Get.width * 0.5 - 24, 120)),
  );

  static ButtonStyle get textSub100 => standard.copyWith(
    backgroundColor: MaterialStateProperty.all(ThemeColors.main),
  );

  static ButtonStyle get textSub200 => standard.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return Colors.grey;
          return ThemeColors.main;
        }),
  );

  static ButtonStyle get delete => standard.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return Colors.grey;
          return Colors.grey;
        }),
  );

  static ButtonStyle get textMain100 => standard.copyWith(
    backgroundColor: MaterialStateProperty.all(ThemeColors.main),
  );

  static ButtonStyle get textMain200 => standard.copyWith(
    backgroundColor: MaterialStateProperty.all(ThemeColors.main),
  );

  static ButtonStyle get sideLine => standard.copyWith(
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return ThemeColors.main;
        }),
    overlayColor: MaterialStateProperty.resolveWith((states) => ThemeColors.main.withOpacity(0.1)),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return Colors.grey;
          return Colors.white;
        }),
    shape: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10));
      }
      return RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: ThemeColors.main),
          borderRadius: BorderRadius.circular(10));
    }),
  );

  static ButtonStyle onOff(bool isOn) => ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(Get.width - ThemePaddings.mainPadding * 2, 54)),
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
    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );

  // static ButtonStyle changeState(buttonClicked) => ButtonStyle(
  //   minimumSize: MaterialStateProperty.all(Size(Get.width - ThemePaddings.mainPadding * 2, 54)),
  //   foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
  //     if (buttonClicked) return ThemeColors.main;
  //     return Colors.white;
  //   }),
  //   overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
  //     if (buttonClicked) return ThemeColors.main.withOpacity(0.1);
  //     return Colors.white.withOpacity(0.1);
  //   }),
  //   backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
  //     if (buttonClicked) return Colors.white;
  //     return ThemeColors.main;
  //   }),
  //   shape: MaterialStateProperty.resolveWith((states) {
  //     if (!buttonClicked) return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  //     return RoundedRectangleBorder(
  //         side: const BorderSide(width: 1.5, color: ThemeColors.main),
  //         borderRadius: BorderRadius.circular(10));
  //   }),
  //   textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
  // );

  static ButtonStyle get menu => ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.black87),
      overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.05)),
      minimumSize: MaterialStateProperty.all(Size(Get.width - ThemePaddings.mainPadding * 2, 48)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))));
}