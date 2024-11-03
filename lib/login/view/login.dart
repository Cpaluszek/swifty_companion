import 'package:flutter/material.dart';
import 'package:swifty_companion/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/login/bloc/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(LoginRequested());
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
