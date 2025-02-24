import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isProcessing = false;
  String _message = '';

  // Function to send reset password link
  Future<void> _sendPasswordResetEmail() async {
    try {
      setState(() {
        _isProcessing = true;
        _message = ''; // Reset message
      });
      String email = _emailController.text;

      // Check if email is valid
      if (email.isEmpty || !email.contains('@')) {
        setState(() {
          _message = 'Please enter a valid email address.';
        });
        return;
      }

      // Try to send password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      setState(() {
        _message = 'Password reset link sent! Check your email.';
      });

    } catch (e) {
      // Check for specific error for non-existent user
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        setState(() {
          _message = 'There is no user with this email.';
        });
      } else {
        setState(() {
          _message = 'Error: ${e.toString()}';
        });
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter your email to reset your password',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter the email you registered with',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            _isProcessing
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _sendPasswordResetEmail,
              child: Text('Send Reset Link'),
            ),
            SizedBox(height: 20),
            if (_message.isNotEmpty) Text(_message),
          ],
        ),
      ),
    );
  }
}
