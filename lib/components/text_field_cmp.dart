// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final controller;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.all(20),
          fillColor: Colors.grey.shade50,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }
}
