// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:task1/components/button_cmp.dart';
import 'package:task1/components/social_cmp.dart';
import 'package:task1/components/text_field_cmp.dart';
import 'package:task1/components/back_button_cmp.dart';
import 'package:task1/components/welcome_text_cmp.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// passwords not corresponding dialog
  void unMatchingPasswords() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Password and Confirm Password must be the same"),
          );
        });
  }

  /// firebase method to create user with email and password
  Future<void> createUser() async {
    /// loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    /// try creating user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        /// pop loading circle
        Navigator.pop(context);
        Navigator.pushNamed(context, '/loginPage');
      } else {
        /// pop loading circle
        Navigator.pop(context);
        unMatchingPasswords();
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("FIREBASE LOGIN ERROR: $e");
      debugPrint("FIREBASE LOGIN MESSAGE: ${e.message}");
      debugPrint("FIREBASE LOGIN CODE: ${e.code}");
      Navigator.pop(context);
    }
  }

  /// navigate to login page
  void navigateToLogin() {
    Navigator.pushNamed(context, '/loginPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackArrow(path: '/firstPage'),
                SizedBox(height: 20),
                WelcomeText(welcomeText: "Hello! Register to get started"),
                SizedBox(height: 40),

                /// Email, Password, Confirm Password text field
                MyTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernameController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
                SizedBox(height: 30),

                /// Register button
                MyButton(
                  onTap: createUser,
                  borderColor: Colors.black,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: "Register",
                ),
                SizedBox(height: 20),

                /// "Or Register with" divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Or Register with",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                /// Register via Socials
                Row(
                  children: [
                    SocialTile(image: "images/facebook.png"),
                    SizedBox(width: 10),
                    SocialTile(image: "images/google.png"),
                    SizedBox(width: 10),
                    SocialTile(image: "images/apple.png"),
                  ],
                ),
                SizedBox(height: 35),

                /// "Already have an account"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: navigateToLogin,
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
