import 'package:flutter/material.dart';
import '../login/userLogin.dart';
import '../../../routes/routes.dart';
import 'dart:async';

var color = 0xFF784ADE;

class Cover extends StatefulWidget {
  @override
  _CoversState createState() => _CoversState();
}

class _CoversState extends State<Cover> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserLogin()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.repeated,
            colors: [
              Color.fromRGBO(74, 201, 89, 1),
              Colors.blue[200],
            ]),
        image: DecorationImage(
            image: AssetImage("assets/images/logo.png"), fit: BoxFit.none),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
