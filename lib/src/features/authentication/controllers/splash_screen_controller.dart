import 'package:get/get.dart';
import 'package:roverapplication/src/features/authentication/screens/welcome/welcome_screen.dart';

class SplashSreenController extends GetxController{
  static SplashSreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(WelcomeScreen());
  }
}
