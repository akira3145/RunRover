import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roverapplication/src/constants/colors.dart';
import 'package:roverapplication/src/constants/image_strings.dart';
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';
import 'package:roverapplication/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:roverapplication/src/features/authentication/screens/signup_screen/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // gradient background 
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDarkMode
                ? [Colors.black, Colors.black87]
                : [Colors.white, Colors.grey.shade200],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: tDefaultSize, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centers vertically
          crossAxisAlignment: CrossAxisAlignment.center, // centers horizontally
          children: [
            // Rover Image
            Image.asset(
              tImgRover,
              height: height * 0.4,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 30),

            // Welcome Texts
            Column(
              children: [
                Text(
                  tWlcmTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: tPrimaryColor),
                ),
                const SizedBox(height: 8),
                Text(
                  tWlcmSubTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: isDarkMode ? Colors.white70 : Colors.black54),
                ),
              ],
            ),

            const SizedBox(height: 50),

            // Buttons (Login and Signup)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGIN BUTTON
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()), 
                    child: Text(
                      tLogin.toUpperCase(),
                      style: const TextStyle(
                        color: tPrimaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // SIGNUP BUTTON
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: Text(
                      tSignup.toUpperCase(),
                      style: TextStyle(
                        color:  tWhiteColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
