import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:email_validator/email_validator.dart' as vd;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../provider/data.dart';
import '../../../provider/User.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:loading/indicator.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../request/login.dart';

var clr = Color.fromRGBO(74, 201, 89, 1);

GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final formKey = GlobalKey<FormState>();
  var validEmial = null;
  var validPassword = null;
  var email;
  var password;

  bool invalid = false;
  bool exist = true;

  bool clickedLogin = false;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          tileMode: TileMode.repeated,
                          colors: [
                        Color.fromRGBO(74, 201, 89, 1),
                        Colors.blue[200],
                      ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [clr, Color(0x44fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "Africoncours",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 40),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      clr,
                      Color.fromRGBO(0, 0, 255, .3),
                    ],
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ((invalid == true)
              ? Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Invalid email or password",
                    style: TextStyle(color: Color.fromRGBO(74, 201, 89, 1)),
                  ),
                )
              : Text("")),
          ((exist != true)
              ? Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "No such account exists",
                    style: TextStyle(color: Color.fromRGBO(74, 201, 89, 1)),
                  ),
                )
              : Text("")),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextFormField(
                cursorColor: Color.fromRGBO(74, 201, 89, 1),
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: Color.fromRGBO(74, 201, 89, .9),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                autovalidate: true,
                validator: (email) {
                  return validEmial;
                },
                onSaved: (email) {
                  this.email = email;
                },
                onChanged: (email) {
                  setState(() {
                    exist = true;
                  });
                  if (vd.EmailValidator.validate(email)) {
                    setState(() {
                      validEmial = null;
                    });
                  } else {
                    setState(() {
                      validEmial = "---------------enter a valid email";
                    });
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextFormField(
                cursorColor: Color.fromRGBO(74, 201, 89, .9),
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(74, 201, 89, .9),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                onSaved: (password) {
                  this.password = password;
                },
                onChanged: (data) {
                  setState(() {
                    invalid = false;
                    exist = true;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color.fromRGBO(74, 201, 89, .9)),
                child: FlatButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        clickedLogin = true;
                      });
                      Navigator.of(context).pushNamed('/user/page');
                    }),
              )),
          SizedBox(
            height: 20,
          ),
          Center(
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/user/forgotPassword');
            },
            child: Text(
              "FORGOT PASSWORD ?",
              style: TextStyle(
                  color: Color.fromRGBO(74, 201, 89, .9),
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          )),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don't have an Account ? ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/user/signup');
                },
                child: Text("Sign Up ",
                    style: TextStyle(
                        color: Color.fromRGBO(220, 20, 47, 0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (clickedLogin == true ? loadingWidget() : Text(""))
        ],
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget loadingWidget() {
  return Center(
    child: Loading(
      color: Color.fromRGBO(74, 201, 89, 1),
      indicator: BallSpinFadeLoaderIndicator(),
      size: 50,
    ),
  );
}
