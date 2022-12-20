import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const MaterialColor _theme = MaterialColor(0XFF72bf44, {
    50: Color(0XFF72bf44),
    100: Color(0XFF80c557),
    200: Color(0XFF8ecc69),
    300: Color(0XFF9cd27c),
    400: Color(0XFFaad98f),
    500: Color(0XFFb9dfa2),
    600: Color(0XFFc7e5b4),
    700: Color(0XFFd5ecc7),
    800: Color(0XFFe3f2da),
    900: Color(0XFFf1f9ec)
  });

  static final ThemeData themeColor =
      ThemeData(primaryColor: colorGreen, primarySwatch: _theme);
  static Color colorGreen = const Color(0XFF72bf44);
  static Color colorWhite = const Color(0xFFFFFFFF);
}
