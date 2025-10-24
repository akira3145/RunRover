import 'package:flutter/material.dart';

class ForgetPasswordBttnWidget extends StatelessWidget {
  const ForgetPasswordBttnWidget({
    required this.bttnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final IconData bttnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade200,
          ),
          child: Row(
              children: [
                Icon(bttnIcon, size: 60,),
                const SizedBox(width: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge,),
                    Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),

                  ],
                )

              ]
          )
      ),
    );
  }
}