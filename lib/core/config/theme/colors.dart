import 'package:flutter/material.dart';

class ColorPalette {
  static const MaterialColor primary = MaterialColor(
    0xffA855F7, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffcb99fa), //10%
      100: Color(0xffc288f9), //20%
      200: Color(0xffb977f9), //30%
      300: Color(0xffb166f8), //40%
      400: Color(0xffa855f7), //50%
      500: Color(0xff974dde), //60%
      600: Color(0xff8644c6), //70%
      700: Color(0xff763bad), //80%
      800: Color(0xff653394), //90%
      900: Color(0xff542b7c), //100%
    },
  );
  static const MaterialColor grey = MaterialColor(
    0xff404040, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff8c8c8c), //10%
      100: Color(0xff797979), //20%
      200: Color(0xff666666), //30%
      300: Color(0xff535353), //40%
      400: Color(0xff404040), //50%
      500: Color(0xff3a3a3a), //60%
      600: Color(0xff333333), //70%
      700: Color(0xff2d2d2d), //80%
      800: Color(0xff262626), //90%
      900: Color(0xff202020), //100%
    },
  );
}

const Color lightGrey = Color(0xFFE0E0E0);
const Color white = Colors.white;
const Color background = Color(0xFFFBFAFF);
const Color border = Color(0xFFCBCBCC);
const Color darkColor = Color(0xFF404040);
