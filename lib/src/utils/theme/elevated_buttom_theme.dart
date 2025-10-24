import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';


class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  //Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: tPrimaryColor,
        backgroundColor: tWhiteColor,
        side: BorderSide(color: tWhiteColor),
        padding: EdgeInsets.symmetric(vertical: tBttnHeight)
    ),
  );

  //Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: tSecondaryColor,
        backgroundColor: tWhiteColor,
        side: BorderSide(color: tWhiteColor),
        padding: EdgeInsets.symmetric(vertical: tBttnHeight)
      ),
    );
}