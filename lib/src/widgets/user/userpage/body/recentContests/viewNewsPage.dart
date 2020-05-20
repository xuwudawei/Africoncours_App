import 'package:flutter/material.dart';

class ViewNews extends StatelessWidget {
  final Map data;
  ViewNews({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Contests"),
          backgroundColor: Color.fromRGBO(37, 211, 102, 1),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data["title"],
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Image.network(
                  data["url"],
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                ),
                Text(data["message"],
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
          ),
        ));
  }
}
