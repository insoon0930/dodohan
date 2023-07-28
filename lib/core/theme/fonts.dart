import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

enum ThemeFonts {
  extraLight,
  light,
  regular,
  medium,
  semiBold,
  bold,
  extraBold,
}

extension TextSizeExt on ThemeFonts {
  // 변형이 필요하면 copyWith 메소드 사용
  TextStyle getTextStyle({Color? color = Colors.black, double? size}) {
    const fontFamily = 'Pretendard';

    switch (this) {
      case ThemeFonts.extraLight:
        return TextStyle(fontSize: size, fontWeight: FontWeight.w200, fontFamily: fontFamily, fontStyle: FontStyle.normal, color: color);
      case ThemeFonts.light:
        return TextStyle(fontSize: size, fontWeight: FontWeight.w300, fontFamily: fontFamily, fontStyle: FontStyle.normal, color: color);
      case ThemeFonts.regular:
        return TextStyle(fontSize: size, fontWeight: FontWeight.w400, fontFamily: fontFamily, fontStyle: FontStyle.normal, color: color);
      case ThemeFonts.medium:
        return TextStyle(fontSize: size, fontWeight: FontWeight.w500, fontFamily: fontFamily, fontStyle: FontStyle.normal, color: color);
      case ThemeFonts.semiBold:
        return TextStyle(fontSize: size, fontWeight: FontWeight.w600, fontFamily: fontFamily, fontStyle: FontStyle.normal, color: color);
      case ThemeFonts.bold:
        return TextStyle(fontSize: size, fontWeight: FontWeight.w700, fontFamily: fontFamily, fontStyle: FontStyle.normal, color: color);
      case ThemeFonts.extraBold:
        return TextStyle(fontSize: size, fontWeight: FontWeight.w800, fontFamily: fontFamily, fontStyle: FontStyle.normal, color: color);
      default:
        throw UnsupportedError('구현되지 않은 Font Theme 입니다.');
    }
  }

  // double getFontSize([Color? color]) {
  //   return getTextStyle(color: color).fontSize!;
  // }
  //
  // FontWeight getFontWeight([Color? color]) {
  //   return getTextStyle(color: color).fontWeight!;
  // }
}