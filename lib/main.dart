import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'package:task1/pages/home_page.dart';
import 'package:task1/pages/login_page.dart';
import 'package:task1/pages/first_page.dart';
import 'package:task1/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task1/pages/forgot_password_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/homePage': (context) => const HomePage(),
        '/firstPage': (context) => const FirstPage(),
        '/loginPage': (context) => const LoginPage(),
        '/signupPage': (context) => const SignupPage(),
        '/forgotPasswordPage': (context) => const ForgotPasswordPage(),
      },
    );
  }
}
