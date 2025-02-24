import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  /// Current User
  static var user = FirebaseAuth.instance.currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// firebase signOut method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/loginPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text("${HomePage.user!.email} Logged In!"),
      ),
    );
  }
}
