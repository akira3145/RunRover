import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roverapplication/src/constants/colors.dart';
import 'package:roverapplication/src/constants/image_strings.dart';
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';
import 'package:roverapplication/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:roverapplication/src/features/authentication/screens/signup_screen/signup_screen.dart';


class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body:Container(
        child: Padding(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage(tImgRover), height: height * 0.6),
              Column(
                children: [
                  Text(tWlcmTitle,
                      style: Theme.of(context).textTheme.displayMedium),
                  Text(tWlcmSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          child: Text(tLogin.toUpperCase(),
                          ),
                      ),
                  ),
                  const SizedBox(
                    width: 10.0
                  ),

                  Expanded(
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const SignupScreen()),
                          child: Text(
                            tSignup.toUpperCase(),
                          ),
                      ),
                  ),
                ],
              )
            ],

          ),
        )

      )
    );
  }
}