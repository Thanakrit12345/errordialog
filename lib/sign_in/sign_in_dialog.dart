import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void showSignInErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Sign-In Error"),
        content: Text("Wrong username or password. Please try again."),
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
