// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:task1/components/button_cmp.dart';
import 'package:task1/components/social_cmp.dart';
import 'package:task1/components/text_field_cmp.dart';
import 'package:task1/components/back_button_cmp.dart';
import 'package:task1/components/welcome_text_cmp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Controller for user credentials
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// firebase method to sign in user with email and password
  Future<void> signUserIn() async {
    /// loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    /// try signing user in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      /// pop loading circle on successful log in
      Navigator.pop(context);
      Navigator.pushNamed(context, '/homePage');

    } on FirebaseAuthException catch (e) {
      /// pop loading circle on error
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        wrongCredentialsMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        wrongCredentialsMessage('Incorrect password.');
      } else if (e.code == 'invalid-email') {
        wrongCredentialsMessage('Invalid email format.');
      } else {
        wrongCredentialsMessage('Something went wrong. Please try again later.');
      }
    }
  }

  /// wrong credentials alert dialog
  void wrongCredentialsMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login Failed"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  /// navigate to signUp page
  void navigateToSignUp() {
    Navigator.pushNamed(context, '/signupPage');
  }

  /// navigate to forgot password
  void navigateToForgotPassword() {
    Navigator.pushNamed(context, '/forgotPasswordPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackArrow(path: '/firstPage'),
                SizedBox(height: 20),
                WelcomeText(
                  welcomeText: "Welcome back! Glad to see you, Again!",
                ),
                SizedBox(height: 40),

                /// Email and password text field
                MyTextField(
                  hintText: "Enter your email",
                  obscureText: false,
                  controller: emailController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "Enter your password",
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 10),

                /// forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: navigateToForgotPassword,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),

                /// login button
                MyButton(
                  borderColor: Colors.grey.shade300,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: "Login",
                  onTap: signUserIn,
                ),
                SizedBox(height: 20),

                /// "Or login with" Divider
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
                        "Or Login with",
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

                /// Login via Socials
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialTile(
                      image: "images/facebook.png",
                    ),
                    SizedBox(width: 10),
                    SocialTile(
                      image: "images/google.png",
                    ),
                    SizedBox(width: 10),
                    SocialTile(
                      image: "images/apple.png",
                    ),
                  ],
                ),
                SizedBox(height: 110),

                /// "Don't have an account" widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: navigateToSignUp,
                      child: Text(
                        "Register Now",
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
