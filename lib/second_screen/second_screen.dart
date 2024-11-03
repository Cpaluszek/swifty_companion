import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/login/bloc/auth_event.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen(
      {super.key,
      required this.token,
      required this.expirationDate,
      required this.refreshToken});

  final String token;
  final String refreshToken;
  final DateTime expirationDate;

  static Route<void> route(
      String token, String refreshToken, DateTime expirationDate) {
    return MaterialPageRoute<void>(
        builder: (_) => SecondScreen(
              token: token,
              refreshToken: refreshToken,
              expirationDate: expirationDate,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Access Token: $token'),
            const SizedBox(height: 8),
            Text('Refresh Token: $refreshToken'),
            const SizedBox(height: 8),
            Text('Expiration Date: ${expirationDate.toLocal()}'),
          ],
        ),
      ),
    );
  }
}
