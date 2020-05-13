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
                          colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Taste Me",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffff3a5a), Color(0xfffe494d)])),
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
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : Text("")),
          ((exist != true)
              ? Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "No such account exists",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : Text("")),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextFormField(
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: Colors.red,
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
                      validEmial = "please enter a valid email";
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
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Colors.red,
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
                    color: Color(0xffff3a5a)),
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
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        print(email);
                        print(password);
                        Login login =
                            Login(email: this.email, password: this.password);
                        Future<Map> data = login.login();
                        // Send data to backend for authentication
                        data.then(
                          (value) async {
                            setState(() {
                              clickedLogin = false;
                            });
                            print(value);
                            if (value["invalid"] == true) {
                              setState(() {
                                invalid = true;
                              });
                            } else if (value["exist"] == false) {
                              setState(() {
                                exist = false;
                              });
                            } else {
                              if (value["logged"] == true) {
                                if (value["verify"] == false) {
                                  Navigator.of(context)
                                      .pushNamed('/confirm/email');
                                } else if (value["first_time"] == true) {
                                  Navigator.of(context)
                                      .pushNamed('/user/continue/registration');
                                  formKey.currentState.reset();
                                } else {
                                  Navigator.of(context).pushNamed('/user/page');
                                  formKey.currentState.reset();
                                }
                                // Navigator.of(context).pushNamed('/user/page');
                              }
                            }
                          },
                        );
                        // If validated, Navvigate to userpage
                      }
                    }),
              )),
          SizedBox(
            height: 20,
          ),
          Center(
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('');
            },
            child: Text(
              "FORGOT PASSWORD ?",
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.w700),
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
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
              ),
              (clickedLogin == true ? loadingWidget() : Text(""))
            ],
          )
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
      color: Colors.pink,
      indicator: BallSpinFadeLoaderIndicator(),
      size: 50,
    ),
  );
}
