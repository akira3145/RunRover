import 'package:flutter/material.dart';
import 'package:roverapplication/src/constants/colors.dart';
import 'package:roverapplication/src/constants/image_strings.dart' show tImgRover;
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: tPrimaryColor),
        title: Text(tAppName, style: Theme.of(context).textTheme.displaySmall),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tPrimaryColor,
            ),
            child: IconButton(onPressed: (){}, icon: Image(image: AssetImage(tImgRover))),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tDashboardTitle, style: textTheme.bodyMedium,),
              Text(tDashboardHeading, style: textTheme.bodyMedium,),
              const SizedBox(height: tDashboardPadding,),
              Container(
                decoration: const BoxDecoration(border: Border(left: BorderSide(width: 4)),),
                child: Row(
                  children: [
                    Text(tDashboardSearch, style: textTheme.displayMedium?.apply(color:  Colors.grey.withOpacity(0.5)),),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
