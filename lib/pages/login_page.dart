// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task1/components/backbutton_cmp.dart';
import 'package:task1/components/button_cmp.dart';
import 'package:task1/components/social_cmp.dart';
import 'package:task1/components/textfield_cmp.dart';
import 'package:task1/components/welcome_text_cmp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackArrow(path: '/firstPage'),
              SizedBox(height: 25),
              WelcomeText(welcomeText: "Welcome back! Glad to see you, Again!"),
              SizedBox(height: 45),
              MyTextField(
                hintText: "Enter your email",
                obscureText: false,
              ),
              SizedBox(height: 20),
              MyTextField(
                hintText: "Enter your password",
                obscureText: true,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ],
              ),
              SizedBox(height: 35),
              MyButton(
                borderColor: Colors.grey.shade300,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                text: "Login",
                onTap: () {},
              ),
              SizedBox(height: 35),
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
              SizedBox(height: 25),
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
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[400],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
