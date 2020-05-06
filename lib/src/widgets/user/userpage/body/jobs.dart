import 'package:flutter/material.dart';

class Job extends StatefulWidget {
  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
      body: Text('Text Input'),
    );
  }
}
