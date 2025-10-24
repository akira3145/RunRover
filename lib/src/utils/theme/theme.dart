import 'package:flutter/material.dart';
import 'package:roverapplication/src/utils/theme/elevated_buttom_theme.dart';
import 'package:roverapplication/src/utils/theme/text_theme.dart';
import 'form_field_theme.dart';
import 'outlined_button_theme.dart';

class TAppTheme{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextThemes.lightTextTheme,
    outlinedButtonTheme: TOultinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
  );


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextThemes.darkTextTheme,
    outlinedButtonTheme: TOultinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
  );

}

class TTextButtonTheme {
  static TextButtonThemeData? get lightTextButtonTheme => null;
  
  static TextButtonThemeData? get darkTextButtonTheme => null;
}