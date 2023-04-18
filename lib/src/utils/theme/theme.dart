
import 'package:acmc/src/utils/theme/textthem.dart';
import 'package:flutter/material.dart';

import '../../constants/gen_swatch.dart';
import 'elevated_button_theme.dart';



class IdTheme {
  IdTheme._();
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xffFDB813),
    primarySwatch: createMaterialColor(const Color(0xffFDB813)),
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextsTheme.lightTheme,
    elevatedButtonTheme: ElevatedButtonThemes.lightTheme,
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff272727),
    primarySwatch: createMaterialColor(const Color(0xff272727)),
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: TextsTheme.darkTheme,
    elevatedButtonTheme: ElevatedButtonThemes.darkTheme,
  );
}