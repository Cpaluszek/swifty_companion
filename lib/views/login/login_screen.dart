import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:swifty_companion/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.title});

  final String title;

  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await AuthService.authenticate();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Login with 42'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
