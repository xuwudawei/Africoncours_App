import 'package:flutter/material.dart';

class AppliedJob extends StatefulWidget {
  @override
  _AppliedJobState createState() => _AppliedJobState();
}

class _AppliedJobState extends State<AppliedJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied Jobs'),
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
      ),
      body: Text('Text Input'),
    );
  }
}
