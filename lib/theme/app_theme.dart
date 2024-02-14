import 'package:tofan/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      fontFamily: 'ReadexPro'
      );

  static ThemeData darkTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: 'ReadexPro',
      colorScheme: darkColorScheme,
      );
}
