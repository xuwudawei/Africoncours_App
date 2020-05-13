import 'package:flutter/material.dart';

bool isSwitched = true;

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text('Profile Visible by others'),
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}