// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String welcomeText;
  const WelcomeText({super.key, required this.welcomeText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
      child: Text(
        welcomeText,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
