import 'package:flutter/material.dart';

ThemeData getMainTheme() {
  return ThemeData.from(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff7067F2),
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.grey,
      error: Colors.red,
      onError: Colors.redAccent,
      background: Color(0xffF6F5FF),
      onBackground: Colors.white70,
      surface: Colors.white,
      onSurface: Colors.white70,
    ),
  );
}
