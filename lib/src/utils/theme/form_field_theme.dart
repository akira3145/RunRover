// lib/src/utils/theme/widget_themes/form_field_theme.dart

import 'package:flutter/material.dart';
import 'package:roverapplication/src/constants/colors.dart';

class TTextFormFieldTheme {
  // Make the constructor private to prevent instantiation.
  TTextFormFieldTheme._();

  // --- Static Light Theme for Input Decoration ---
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    // Default border for all states
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
          width: 1.5,
          color: Colors.white70),
    ),
    // Border style when the field is focused (being typed in)
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 2.0,
        color: Colors.white, // A distinct color for focus
      ),
    ),
    /* Border style when an error occurs
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Colors.red,
      ),
    ),
    // Border style when an error occurs and the field is focused
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 2.0,
        color: Colors.yello,
      ),
    ),*/
    // Style for the label (e.g., "Email", "Password")
    labelStyle: const TextStyle(color: Colors.white),

    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
  );

  // --- Static Dark Theme for Input Decoration ---
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    // Default border for all states
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.white70
      )
    ),
    // Border style when the field is focused
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 2.0,
        color: tPrimaryColor, // A distinct color for focus in dark mode
      ),
    ),
    /* Border style when an error occurs
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Colors.red,
      ),
    ),
    // Border style when an error occurs and the field is focused
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 2.0,
        color: Colors.red,
      ),
    ),*/
    // Style for the label
    labelStyle: const TextStyle(color: Colors.white),
    // Style for the prefix and suffix icons
    prefixIconColor: tPrimaryColor,
    suffixIconColor: tPrimaryColor,
  );
}
