import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart' as vd;

GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formkey = GlobalKey<FormState>();

  var validEmail = null;
  final formKey = GlobalKey<FormState>();
  var emails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(74, 201, 89, .9),
        title: Text(
          "Forgot Password",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Enter your Email",
                  style: TextStyle(fontFamily: 'serif', fontSize: 30.0),
                ),
                SizedBox(
                  height: 40,
                ),
                email(context),
                SizedBox(
                  height: 30,
                ),
                update(context),
              ],
            ),
          ))),
    );
  }

  Widget email(context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "example@123.com",
          labelText: "Email",
          labelStyle: TextStyle(
              //color: Color.fromRGBO(74, 201, 89, .9),
              ),
          prefixIcon: Material(
            elevation: 0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Icon(
              Icons.email,
              color: Color.fromRGBO(74, 201, 89, .9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(74, 201, 89, .9),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(74, 201, 89, .9),
          )),
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

  Widget update(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        color: Color.fromRGBO(74, 201, 89, .9),
        child: Text(
          "Send Password Reset Link",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
        onPressed: () {
          showDoneSnackBar();
        },
      ),
    );
  }
}

showDoneSnackBar() {
  final snackbar = SnackBar(
    backgroundColor: Color.fromRGBO(74, 201, 89, .9),
    content: Text(
      "Check your email for password reset link",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ),
  );
  _scaffold.currentState.showSnackBar(snackbar);
}
