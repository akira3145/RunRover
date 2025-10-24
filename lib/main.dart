import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:roverapplication/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:roverapplication/src/utils/theme/theme.dart';


// Create a global ValueNotifier to hold the current theme mode.
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use ValueListenableBuilder to listen for theme changes.
        return GetMaterialApp(
          //THEME
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          themeMode: ThemeMode.system,

          // Set home page.
          home: LoginScreen(),
        );
  }
}
