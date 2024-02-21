import 'package:flutter/material.dart';

class MySnackbar {
  static showComingSoonSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Coming soon'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
