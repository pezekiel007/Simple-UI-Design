// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SocialTile extends StatelessWidget {
  final String image;
  const SocialTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image(image: AssetImage(image), height: 45),
      ),
    );
  }
}
