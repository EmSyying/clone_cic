import 'package:cicgreenloan/core/auth/login.dart';
import 'package:flutter/material.dart';

skiptoLogin(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
}
