import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  final String path;
  const BackArrow({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(22.0, 15.0, 15.0, 15.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
