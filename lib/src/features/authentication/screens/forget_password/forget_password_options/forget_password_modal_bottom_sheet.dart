import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roverapplication/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import '../../../../../Constants/sizes.dart';
import '../../../../../Constants/text_strings.dart';
import 'forget_password_bttn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) =>
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(tDefaultSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tForgetPasswordTitle,
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayMedium,
                      ),
                      Text(tForgetPasswordSubtitle,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                      const SizedBox(height: tFormHeight,),
                      ForgetPasswordBttnWidget(
                        bttnIcon: Icons.email_outlined,
                        title: tEmail,
                        subtitle: tResetViaEmail,
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(() => const ForgetPasswordMailScreen());
                          },
                      ),
              
                      const SizedBox(height: 20.0),
              
                      ForgetPasswordBttnWidget(
                        bttnIcon: Icons.mobile_friendly_rounded,
                        title: tPhoneNumber,
                        subtitle: tResetViaPhone,
                        onTap: () {},
                      ),
              
                    ],
                  )
              ),
            )
    );
  }
}
