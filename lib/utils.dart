import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

bool isTokenExpired(DateTime expiration) {
  return expiration.isBefore(DateTime.now());
}
