import 'package:flutter/material.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:swifty_companion/config/env_config.dart';
import 'dart:developer' as developer;

import 'package:swifty_companion/presentation/second_screen/second_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? accessToken;
  late final OAuth2Helper _oauth2Helper;

  // TODO: adapt to mobile or web
  final client = OAuth2Client(
    authorizeUrl: EnvConfig.authorizeUrl,
    tokenUrl: EnvConfig.tokenUrl,
    redirectUri: EnvConfig.authWebRedirect,
    customUriScheme: EnvConfig.webUriScheme,
  );

  @override
  void initState() {
    super.initState();
    _oauth2Helper = OAuth2Helper(
      client,
      grantType: OAuth2Helper.authorizationCode,
      clientId: EnvConfig.apiUid,
      clientSecret: EnvConfig.apiSecret,
      scopes: ['public'],
    );
  }

  Future<void> getToken() async {
    try {
      var result = await _oauth2Helper.getToken();
      if (result != null) {
        Navigator.pushReplacementNamed(context, '/search');
      } else {
        // Token retrieval failed, handle accordingly.
        print('Error: Token is null');
      }
    } catch (e) {
      // Handle the error
      print('Error getting token: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await getToken();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Login with 42"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
