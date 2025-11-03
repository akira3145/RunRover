import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roverapplication/src/constants/colors.dart';
import 'package:roverapplication/src/constants/image_strings.dart';
import 'package:roverapplication/src/constants/sizes.dart';
import 'package:roverapplication/src/constants/text_strings.dart';
import 'package:roverapplication/src/features/core/screens/dashboard/widgets/dashboard_card_widget.dart';
import 'package:roverapplication/src/features/core/screens/start_running/start_running.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: tPrimaryColor),
        title: Text(tAppName, style: textTheme.displaySmall?.copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tPrimaryColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(image: AssetImage(tImgRover)),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tDashboardTitle,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white70)),
              Text(tDashboardHeading,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white)),
              const SizedBox(height: 25),

              // **Card 1
              DashboardCardWidget(context: context, title: tDashboardStartRunning, subtitle: tDashboardStartRunningSubtitle, icon: Icons.directions_run, onTap: () => Get.to(() => const StartRunningScreen())),
              const SizedBox(height: 15),

              // **Card 2
              DashboardCardWidget(context: context, title: tDashboardHistory, subtitle: tDashboardHistorySubtitle, icon: Icons.history, onTap: () => Get.to(() => const RoutesScreen())),
              const SizedBox(height: 15),

              // **Card 3
              DashboardCardWidget(context: context, title: tDashboardSettings, subtitle: tDashboardSettingsSubtitle, icon: Icons.settings, onTap: () => Get.to(() => const SettingsScreen())),
            ],
          ),
        ),
      ),
    );
  }
}





class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Routes")),
        body: const Center(child: Text("Routes Screen")),
      );
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: const Center(child: Text("Settings Screen")),
      );
}
