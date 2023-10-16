import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
void showSignUpErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Sign-Up Error"),
        content: Text("An account with this email already exists. Please sign in or use a different email."),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}