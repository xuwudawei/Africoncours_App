import 'dart:convert';

import 'package:flutter/material.dart';
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
    // final logged = Provider.of<AppState>(context);
    // final User = Provider.of<UserInfoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Africoncours'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "User Login",
                  style: TextStyle(fontSize: 30.0, fontFamily: 'serif'),
                ),
                SizedBox(
                  height: 50,
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
                emailField(),
                SizedBox(
                  height: 30,
                ),
                passwordField(),
                SizedBox(
                  height: 30,
                ),
                loginField(context),
                SizedBox(
                  height: 8,
                ),
                (clickedLogin == true ? loadingWidget() : Text(""))
                // SizedBox(height: 10,),
                // gotoSignUp(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Theme(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "email",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "example@123.com",
          prefixIcon: Icon(FontAwesomeIcons.user),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(220, 20, 47, 0.7),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(220, 20, 47, 0.7),
          )),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
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
      data: Theme.of(context).copyWith(
        primaryColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
    );
  }

  Widget passwordField() {
    return Theme(
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "password",
            hintStyle: TextStyle(fontSize: 25),
            hintText: "*******",
            prefixIcon: Icon(FontAwesomeIcons.lock),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(220, 20, 47, 0.7),
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(220, 20, 47, 0.7),
            )),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
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
      data: Theme.of(context).copyWith(
        primaryColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
    );
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

  Widget loginField(context) {
    final studentUser = Provider.of<UserInfoProvider>(context);
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50.0,
      child: RaisedButton(
        color: Color.fromRGBO(220, 20, 47, 0.7),
        child: Text(
          "login",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            clickedLogin = true;
          });
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print(email);
            print(password);
            Login login = Login(email: this.email, password: this.password);
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
                      Navigator.of(context).pushNamed('/confirm/email');
                    } else if (value["first_time"] == true) {
                      studentUser.setUserInfo(value);
                      Navigator.of(context)
                          .pushNamed('/user/continue/registration');
                      formKey.currentState.reset();
                    } else {
                      studentUser.setUserInfo(value);
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
        },
      ),
    );
  }
}
