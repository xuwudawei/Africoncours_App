import 'package:flutter/material.dart';
import 'firstpage.dart';
import '../../../routes/routes.dart';
import 'dart:async';

class Cover extends StatefulWidget {
  @override
  _CoversState createState() => _CoversState();
}

class _CoversState extends State<Cover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: RaisedButton(
        textColor: Colors.white,
        color: Color.fromRGBO(220, 20, 47, 0.7),
        child: Text(
          "Africoncours",
          style: TextStyle(fontFamily: 'serif', fontSize: 30.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/user/login', arguments: "Turn");
        },
      ),
    );
  }
}
