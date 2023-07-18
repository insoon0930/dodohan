import 'package:flutter/material.dart';
import 'package:stamp_now/core/theme/colors.dart';

class MainTheme {
  static final ThemeData light = ThemeData.light().copyWith(
    // scaffoldBackgroundColor: ThemeColors.background,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
            fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black, height: 1),
        iconTheme: IconThemeData(color: Colors.black)),
    // todo
    // buttonTheme: const ButtonThemeData(
    //   textTheme: ButtonTextTheme.accent,
    // ),

    // primaryColor: ThemeColors.specialColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6750a4)),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
  );
}
