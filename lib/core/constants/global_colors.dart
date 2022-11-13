import 'package:flutter/material.dart';

class GlobalColors {
  GlobalColors._();
  static const Color primary = Color(0xff142D5D);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color white = Color(0xffffffff);
  static const Color lightGrey = Color(0xffe3eaf2);
  static const Color grey = Color(0xff666666);

  static final themeLight = ThemeData(
    scaffoldBackgroundColor: GlobalColors.backgroundColor,
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme.light(
      primary: GlobalColors.primary,
    ),
  );
}
