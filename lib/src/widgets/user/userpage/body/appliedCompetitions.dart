import 'package:flutter/material.dart';

class AppliedCompetition extends StatefulWidget {
  @override
  _AppliedCompetitionState createState() => _AppliedCompetitionState();
}

class _AppliedCompetitionState extends State<AppliedCompetition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied Competitions'),
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
      ),
      body: Text('Text Input'),
    );
  }
}
