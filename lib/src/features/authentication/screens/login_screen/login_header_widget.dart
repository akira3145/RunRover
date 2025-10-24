import 'package:flutter/material.dart';

import '../../../../Constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(tImgRover),
          height: size.height * 0.2,
        ),

        Text(tLoginTitle,
            style: Theme.of(context).textTheme.displayLarge
        ),
        Text(tLoginSubtitle,
            style: Theme.of(context).textTheme.bodyLarge
        ),
      ],
    );
  }
}