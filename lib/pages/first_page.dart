import 'package:flutter/material.dart';
import 'package:task1/components/button_cmp.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/bg.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/loginPage');
                },
                borderColor: Colors.black,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                text: "Login",
              ),
              const SizedBox(height: 20),
              MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/signupPage');
                },
                borderColor: Colors.black,
                backgroundColor: Colors.transparent,
                textColor: Colors.black,
                text: "Register",
              ),
              const SizedBox(height: 35),
              Text(
                "Continue as a guest",
                style: TextStyle(
                  color: Colors.greenAccent[400],
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.greenAccent[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
