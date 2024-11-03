import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:swifty_companion/config/env_config.dart';
import 'package:swifty_companion/config/theme.dart';
import 'package:swifty_companion/views/login/login_screen.dart';

Future main() async {
  await EnvConfig.loadEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: catppuccinTheme(catppuccin.macchiato),
      home: LoginScreen(title: 'Swifty Companion'),
    );
  }
}
