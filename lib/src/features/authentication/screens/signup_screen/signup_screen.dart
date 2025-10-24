import 'package:flutter/material.dart';
import 'package:roverapplication/src/common_widget/forms/form_footer_widget.dart';
import 'package:roverapplication/src/common_widget/forms/form_header_widget.dart';
import 'package:roverapplication/src/constants/image_strings.dart';
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';
import 'package:roverapplication/src/features/authentication/screens/signup_screen/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                FormHeaderWidget(
                    image: tImgRover,
                    title: tSignUpTitle,
                    subtitle: tSignUpSubtitle
                ),

                const SignupFormWidget(),

                FormFooterWidget(txtBttn: tAlreadyHaveAnAccount, concatTxtBttn: tLogin)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

