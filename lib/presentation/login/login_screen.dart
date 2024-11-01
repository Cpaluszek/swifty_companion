import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () => {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Login with 42"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
