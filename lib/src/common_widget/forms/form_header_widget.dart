import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({super.key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subtitle,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
  });

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(image), color: imageColor, height: size.height * imageHeight,),
        SizedBox(height: heightBetween),
        Text(textAlign: textAlign, title, style: Theme.of(context).textTheme.displayLarge),
        Text(textAlign: textAlign, subtitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}