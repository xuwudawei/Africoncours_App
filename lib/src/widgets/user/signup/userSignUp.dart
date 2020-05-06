import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:email_validator/email_validator.dart' as vd;
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import '../../../request/signup.dart';

class UserSignup extends StatefulWidget {
  @override
  _UserSignupState createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  var validFirstname = null;
  var validLastname = null;
  var validEmail = null;
  var valipPassword = null;
  var validComPass = null;
  var savedPass = "";

  bool exist = false;
  bool invalidToken = false;
  bool clickSignUp = false;

  final formKey = GlobalKey<FormState>();

  var firstName;
  var lastName;
  var tokens;
  var emails;
  var passwords;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
        title: Text("Africoncours"),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  "User Signup",
                  style: TextStyle(fontFamily: 'serif', fontSize: 30.0),
                ),
                SizedBox(
                  height: 40,
                ),
                ((exist == true)
                    ? Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "User with email exists",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      )
                    : Text("")),
                ((invalidToken == true)
                    ? Container(
                        padding: EdgeInsets.all(5),
                        child: Text("Invalid token",
                            style: TextStyle(color: Colors.red)))
                    : Text("")),
                firstname(context),
                SizedBox(
                  height: 10,
                ),
                lastname(context),
                SizedBox(
                  height: 10,
                ),
                token(context),
                SizedBox(
                  height: 10,
                ),
                email(context),
                SizedBox(
                  height: 10,
                ),
                password(context),
                SizedBox(
                  height: 10,
                ),
                signup(context),
                SizedBox(
                  height: 9,
                ),
                (clickSignUp == true ? loadingWidget() : Text(""))
              ],
            ),
          ))),
    );
  }

  Widget firstname(context) {
    return TextFormField(
        decoration: InputDecoration(
            hintText: "firstname",
            labelText: "firstname",
            labelStyle: TextStyle(color: Color.fromRGBO(220, 20, 47, 0.7)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
        onSaved: (firstname) {
          this.firstName = firstname;
        },
        autovalidate: true,
        validator: (firstname) {
          return validFirstname;
        },
        onChanged: (firstname) {
          if (firstname.isEmpty) {
            setState(() {
              validFirstname = "Field required";
            });
          } else {
            setState(() {
              validFirstname = null;
            });
          }
        });
  }

  Widget lastname(context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "lastname",
          labelText: "lastname",
          labelStyle: TextStyle(color: Color.fromRGBO(220, 20, 47, 0.7)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      onSaved: (lastname) {
        this.lastName = lastname;
      },
      autovalidate: true,
      validator: (lastname) {
        return validLastname;
      },
      onChanged: (lastname) {
        if (lastname.isEmpty) {
          setState(() {
            validLastname = "Field required";
          });
        } else {
          setState(() {
            validLastname = null;
          });
        }
      },
    );
  }

  Widget token(context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "CXG12S",
          labelText: "token",
          labelStyle: TextStyle(color: Color.fromRGBO(220, 20, 47, 0.7)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      onSaved: (token) {
        this.tokens = token;
      },
    );
  }

  Widget email(context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "example@123.com",
          labelText: "email",
          labelStyle: TextStyle(color: Color.fromRGBO(220, 20, 47, 0.7)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      onSaved: (email) {
        this.emails = email;
      },
      autovalidate: true,
      validator: (email) => validEmail,
      onChanged: (email) {
        if (vd.EmailValidator.validate(email)) {
          setState(() {
            validEmail = null;
          });
        } else {
          setState(() {
            validEmail = "Please enter a valid email";
          });
        }
      },
    );
  }

  Widget password(context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "******",
          labelText: "password",
          labelStyle: TextStyle(color: Color.fromRGBO(220, 20, 47, 0.7)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(220, 20, 47, 0.7))),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      onSaved: (password) {
        this.passwords = password;
      },
      autovalidate: true,
      validator: (password) => valipPassword,
      onChanged: (password) {
        savedPass = password;
        setState(() {
          valipPassword = passwordValidator(password);
        });
      },
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Loading(
        color: Colors.pink,
        indicator: BallSpinFadeLoaderIndicator(),
        size: 50.0,
      ),
    );
  }

  Widget signup(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        color: Color.fromRGBO(220, 20, 47, 0.7),
        child: Text(
          "Signup",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
        onPressed: () {
          setState(() {
            clickSignUp = true;
          });
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            // Send data to the backend for registration
            SignUpRequest sign = SignUpRequest(
                email: this.emails,
                lastname: this.lastName,
                firstname: this.firstName,
                password: this.passwords,
                token: this.tokens);
            Future<Map> data = sign.studentSignUp();

            data.then((onValue) {
              if (onValue["invalid"] == true) {
                formKey.currentState.reset();
                setState(() {
                  invalidToken = true;
                  clickSignUp = false;
                });
              } else if (onValue["exist"] == true) {
                formKey.currentState.reset();
                setState(() {
                  exist = true;
                  clickSignUp = false;
                });
              } else if (onValue["success"] == true) {
                // Navigate to confirmation pag
                formKey.currentState.reset();
                setState(() {
                  clickSignUp = false;
                });
                Navigator.of(context).pushNamed('/confirm/email');
              }
            });
          }
        },
      ),
    );
  }

  Widget gotoLogin(context) {
    return ListTile(
      leading: Text("Already got an account"),
      trailing: FlatButton(
        child: Text(
          "Login",
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/student/login');
        },
      ),
      // title: Text("Login"),
    );
  }
}
