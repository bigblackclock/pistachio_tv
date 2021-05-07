import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const primaryColor = Color(0xff20232C);
  static const yellow = Color(0xfffbdd33);
  static const gray = Color(0xff74777f);
  static const green = Color(0xff78cdd4);
  static const red = Color(0xfff15b6c);

  static final ThemeData themeData = ThemeData(
    accentColor: yellow,
    scaffoldBackgroundColor: primaryColor,
  );
}
