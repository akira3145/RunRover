import 'package:flutter/material.dart';
import 'package:roverapplication/src/constants/image_strings.dart';
import 'package:roverapplication/src/constants/text_strings.dart';
import '../../Constants/sizes.dart' show tFormHeight;

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,

    required this.txtBttn,
    required this.concatTxtBttn,
  });
 final String txtBttn, concatTxtBttn;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "OR",
          style: TextStyle(
            color: Colors.white70, // <-- Change this color to whatever you need
          ),
        ),
        const SizedBox(height: tFormHeight -20,),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: Image(
              image: AssetImage(tGIcon),
              width: 30.0,
            ),
            onPressed: (){},
            label: Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(height: tFormHeight -20,),

        TextButton(
            onPressed: (){},
            child:Text.rich(
                TextSpan(
                    text: txtBttn,
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: " $concatTxtBttn",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ]
                )
            )

        ),
      ],
    );
  }
}