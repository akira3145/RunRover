import 'package:flutter/material.dart';

import '../../../../Constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight -10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),

            const SizedBox(
              height: tFormHeight -20,
            ),

            TextFormField(
              decoration: InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.email_outlined)
              ),
            ),

            const SizedBox(
              height: tFormHeight -20,
            ),

            TextFormField(
              decoration: InputDecoration(
                  label: Text(tPhoneNumber),
                  prefixIcon: Icon(Icons.numbers)
              ),
            ),

            const SizedBox(
              height: tFormHeight -20,
            ),

            TextFormField(
              decoration: InputDecoration(
                  label: Text(tPassword),
                  prefixIcon: Icon(Icons.password_outlined)
              ),
            ),

            const SizedBox(
              height: tFormHeight -10,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(tSignup.toUpperCase())
              ),
            ),
          ],
        )
    );
  }
}
