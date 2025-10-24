import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roverapplication/src/constants/colors.dart';
import 'package:roverapplication/src/constants/image_strings.dart';
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';
import 'package:roverapplication/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashSreenController());

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    //var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    splashScreenController.startAnimation();
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: splashScreenController.animate.value ? 0 : -30,
            left: splashScreenController.animate.value ? 0 : -30,
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashScreenController.animate.value ? 1 : 0,
                child: const Image(image: AssetImage(tImgRover))
              ),
            ),
          ),

          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: splashScreenController.animate.value ? tDefaultSize : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashScreenController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      tAppLine,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashScreenController.animate.value ? 100 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashScreenController.animate.value ? 1 : 0,
                child: Image(image: AssetImage(tImgRover)),
              ),
            ),
          ),

          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashScreenController.animate.value ? 60 : 0,
              right: tDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashScreenController.animate.value ? 1 : 0,
                child: Container(
                  width: tSplashContainerSize,
                  height: tSplashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: tPrimaryColor,
                  ),
               ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
