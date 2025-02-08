import 'package:flutter/material.dart';
import 'package:task1/pages/first_page.dart';
import 'package:task1/pages/login_page.dart';
import 'package:task1/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      routes: {
        '/firstPage': (context) => const FirstPage(),
        '/loginPage': (context) => const LoginPage(),
        '/signupPage': (context) => const SignupPage(),
      },
    );
  }
}
