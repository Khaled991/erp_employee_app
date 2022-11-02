import 'package:flutter/material.dart';

class GlobalColors {
  GlobalColors._();
  static const Color primary = Color(0xff142D5D);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color white = Color(0xffffffff);

  static final themeLight = ThemeData(
    scaffoldBackgroundColor: GlobalColors.backgroundColor,
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme.light(
      primary: GlobalColors.primary,
    ),
    // appBarTheme: const AppBarTheme(
    //   elevation: 0,
    //   iconTheme: IconThemeData(
    //     color: Colors.black,
    //   ),
    // ),
  );
}
