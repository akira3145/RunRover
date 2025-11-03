import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';


class TOultinedButtonTheme{
  TOultinedButtonTheme._();

  //Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: tWhiteColor,
        backgroundColor: tPrimaryColor,
        side: BorderSide(color: tWhiteColor),
        padding: EdgeInsets.symmetric(vertical: tBttnHeight)
    ),
  );

  //Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: tWhiteColor,
        backgroundColor: tPrimaryColor,
        side: BorderSide(color: tWhiteColor),
        padding: EdgeInsets.symmetric(vertical: tBttnHeight)
    ),
  );
}