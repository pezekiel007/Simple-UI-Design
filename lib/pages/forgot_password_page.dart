import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task1/components/button_cmp.dart';
import 'package:task1/components/text_field_cmp.dart';
import 'package:task1/components/back_button_cmp.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  // Try to reset user password
  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Password Reset Link Sent"),
            content: const Text("Click on the link we sent to your e-mail"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/loginPage');
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("FIREBASE RESET ERROR: $e");
      debugPrint("FIREBASE RESET CODE: ${e.code}");
      debugPrint("FIREBASE RESET MESSAGE: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackArrow(path: '/loginPage'),
              const SizedBox(height: 220),
              const Text(
                "Enter Email to reset password",
                style: TextStyle(),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: "Enter your email",
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 30),
              MyButton(
                onTap: resetPassword,
                borderColor: Colors.grey.shade300,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                text: "Reset Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
