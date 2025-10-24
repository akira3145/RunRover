import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roverapplication/src/constants/image_strings.dart';
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';
import 'package:roverapplication/src/common_widget/forms/form_header_widget.dart';

import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget{
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox( height: tDefaultSize * 4,),
                FormHeaderWidget(
                  image: tImgRover,
                  title: tForgetPassword,
                  subtitle: tForgetMailSubtitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children:[
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text(tEmail),
                          hintText: tEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:(){
                            Get.to(() => const OTPScreen());
                          },
                          child: Text(tNext)
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

}