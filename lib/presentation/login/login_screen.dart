import 'package:flutter/material.dart';
import 'package:swifty_companion/config/env_config.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final String authorizationEndpoint = EnvConfig.apiAuthEndpoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(authorizationEndpoint),
              ),
            ),
          )
        ],
      ),
    );
  }
}
