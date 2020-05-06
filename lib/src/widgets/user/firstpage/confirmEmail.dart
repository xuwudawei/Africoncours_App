import 'package:flutter/material.dart';

class ConfirmEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
        title: Text("Email verification"),
      ),
      body: Center(
        child: Text(
          "Please check your email and click on the verification link",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'serif',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
