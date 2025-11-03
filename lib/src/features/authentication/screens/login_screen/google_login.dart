import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({super.key});

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account == null) return; // user canceled login
      final GoogleSignInAuthentication auth = await account.authentication;

      // ***Send token to your backend
      final response = await http.post(
        Uri.parse("http://YOUR_API_URL/api/auth/google"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': auth.idToken}),
      );

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        debugPrint("Logged in as: ${user['name']}");
      } else {
        debugPrint("Backend error: ${response.body}");
      }
    } catch (error) {
      debugPrint("Google Sign-In failed: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.login),
          label: const Text("Sign in with Google"),
          onPressed: _handleSignIn,
        ),
      ),
    );
  }
}
