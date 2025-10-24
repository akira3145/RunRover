import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';


class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final headlineMedium = Theme.of(context).textTheme.headlineMedium;

    // --- THIS IS THE FIX ---
    // Create a list of styles with a length that matches numberOfFields (6).
    // This satisfies the package's assertion rule.
    final List<TextStyle?> otpTextStyles = List.generate(6, (index) => headlineMedium);
    // --- END OF FIX ---

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(
              tOtpSubtitle.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 40.0),
            const Text(
              "$tOtpMessage email nila",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            OtpTextField(
              numberOfFields: 6,
              showFieldAsBox: true,
              fieldWidth: 50.0,

              // Use the correctly generated list of styles
              styles: otpTextStyles,

              borderColor: Color.fromRGBO(primaryColor.red, primaryColor.green, primaryColor.blue, 0.7),
              focusedBorderColor: primaryColor,
              fillColor: const Color(0x1A000000),
              filled: true,
              onSubmit: (code) {
                print("OTP is => $code");
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(tNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
