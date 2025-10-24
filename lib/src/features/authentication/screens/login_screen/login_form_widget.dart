import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roverapplication/src/features/core/screens/dashboard/dashboard.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false; // 👈 controls visibility of password

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EMAIL FIELD
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: tFormHeight),

            // PASSWORD FIELD
            TextFormField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: tFormHeight),

            // FORGET PASSWORD BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(tForgetPassword),
              ),
            ),

            // LOGIN BUTTON
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const Dashboard());
                },
                child: Text(tLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
