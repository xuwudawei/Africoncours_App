import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Color.fromRGBO(37, 211, 102, 1),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    '''This a complete mobile app solution that enable a competitor to register for any competitions from various companies''',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ));
  }
}
