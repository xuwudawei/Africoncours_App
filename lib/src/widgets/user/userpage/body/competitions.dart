import 'package:flutter/material.dart';

class Competition extends StatefulWidget {
  @override
  _CompetitionState createState() => _CompetitionState();
}

class _CompetitionState extends State<Competition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Competitions'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
      body: Text('Text Input'),
    );
  }
}
