import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/utils/theme/textthem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gen_swatch.dart';
import 'elevated_button_theme.dart';

class IdTheme {
  IdTheme._();
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xffFDB813),
    primarySwatch: createMaterialColor(const Color(0xffFDB813)),
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextsTheme.lightTheme,
    appBarTheme: const AppBarTheme(centerTitle: false),
    elevatedButtonTheme: ElevatedButtonThemes.lightTheme,
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
        ),
        constraints: BoxConstraints(
          maxHeight: 40.h,
          maxWidth: double.maxFinite,
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => IdColors.backgroundColour,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.r,
            ),
          ),
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff272727),
    primarySwatch: createMaterialColor(const Color(0xff272727)),
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: TextsTheme.darkTheme,
    appBarTheme: const AppBarTheme(centerTitle: false),
    elevatedButtonTheme: ElevatedButtonThemes.darkTheme,
  );
}
