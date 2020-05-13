import 'package:flutter/material.dart';

class UserOption extends StatefulWidget {
  @override
  _UserOptionState createState() => _UserOptionState();
}

class _UserOptionState extends State<UserOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(220, 20, 47, 0.7),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              login(context),
              SizedBox(
                height: 20,
              ),
              signUp(context)
            ],
          ),
        ));
  }

  Widget login(context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontFamily: 'serif', fontSize: 25.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/user/login');
        },
      ),
    );
  }

  Widget signUp(context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          "SignUp",
          style: TextStyle(
              color: Colors.black, fontFamily: 'serif', fontSize: 25.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/user/signup');
        },
      ),
    );
  }
}
