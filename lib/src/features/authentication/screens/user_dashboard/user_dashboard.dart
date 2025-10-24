// lib/user_dashboard.dart
import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        backgroundColor: Colors.orange.shade900,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to your Dashboard!',
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
