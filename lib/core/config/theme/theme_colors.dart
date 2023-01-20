import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._();
  static const Color primary = Color(0xff142D5D);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color white = Color(0xffffffff);
  static const Color lightGrey = Color(0xffe3eaf2);
  static const Color grey = Color(0xff666666);
  static const Color red = Colors.red;
  static const Color green = Colors.green;

  static final themeLight = ThemeData(
    scaffoldBackgroundColor: ThemeColors.backgroundColor,
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme.light(
      primary: ThemeColors.primary,
    ),
  );
}
