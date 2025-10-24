/*import 'package:flutter/material.dart';
import 'package:roverapplication/main.dart';
import 'package:roverapplication/src/constants/colors.dart';
import 'package:roverapplication/src/features/authentication/screens/user_dashboard/user_dashboard.dart';


class LoginScreen1 extends StatefulWidget {
  const LoginScreen1 ({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  // A GlobalKey to uniquely identify the Form widget and allow validation.
  final _formKey = GlobalKey<FormState>();

  // State variable to track password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Determine if the current theme is dark
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Run Rover Login Screen'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 5,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        // Add a theme toggle switch to the AppBar
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              // Toggle the theme mode
              themeNotifier.value =
              isDarkMode ? ThemeMode.light : ThemeMode.dark;
            },
          )
        ],
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView to prevent overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'Welcome to RunRover',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.orange.shade900,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Form(
                key: _formKey, // Assign the key to the form
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        // Enhanced email validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: TextFormField(
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter password',
                          prefixIcon: const Icon(Icons.password),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        // Simple password validator
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar and navigate.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserDashboard(),
                              ),
                            );
                          }
                        },
                        color: tPrimaryColor,
                        textColor: tWhiteColor,
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          // You can add validation for the signup button too if needed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        color: Colors.orange,
                        textColor: Colors.white,
                        child: const Text('Sign up'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignupScreen {
  const SignupScreen();
}*/
