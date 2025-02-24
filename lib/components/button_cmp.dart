// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const MyButton({
    super.key,
    required this.onTap,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor, //Colors.grey.shade300
          ),
          color: backgroundColor, //Colors.black
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold//Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
