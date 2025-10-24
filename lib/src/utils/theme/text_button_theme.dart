// lib/src/utils/theme/widget_themes/text_button_theme.dart

import 'package:flutter/material.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  // --- Light Theme for TextButton ---
  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      //textStyle: Colors.orange, // This sets the text color for all TextButtons
    ),
  );

  // --- Dark Theme for TextButton ---
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      //foregroundColor: Colors.orange, // A nice bright color for dark mode
    ),
  );
}
