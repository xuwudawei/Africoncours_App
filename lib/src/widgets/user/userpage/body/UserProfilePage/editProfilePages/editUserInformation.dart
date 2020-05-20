import 'package:flutter/material.dart';

class EditUserInformation extends StatefulWidget {
  @override
  _EditUserInformationState createState() => _EditUserInformationState();
}

class _EditUserInformationState extends State<EditUserInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Information'),
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
      ),
    );
  }
}
