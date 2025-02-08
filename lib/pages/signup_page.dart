// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task1/components/backbutton_cmp.dart';
import 'package:task1/components/button_cmp.dart';
import 'package:task1/components/social_cmp.dart';
import 'package:task1/components/textfield_cmp.dart';
import 'package:task1/components/welcome_text_cmp.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackArrow(path: '/firstPage'),
              SizedBox(height: 25),
              WelcomeText(
                welcomeText: "Hello! Register to get started",
              ),
              SizedBox(height: 45),
              MyTextField(
                hintText: "Username",
                obscureText: false,
              ),
              SizedBox(height: 10),
              MyTextField(
                hintText: "Email",
                obscureText: false,
              ),
              SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                obscureText: false,
              ),
              SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm Password",
                obscureText: false,
              ),
              SizedBox(height: 30),
              MyButton(
                onTap: () {},
                borderColor: Colors.black,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                text: "Register",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  Text(
                    "Login Now",
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
