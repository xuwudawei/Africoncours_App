import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart' as vd;

var bg = 0xFF784ADE;

class ChangeEmail extends StatefulWidget {
  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  var validEmail = null;
  final formKey = GlobalKey<FormState>();
  var emails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(bg),
        title: Text("Account Security"),
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
                  "Change Email",
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
          labelText: "New email",
          labelStyle: TextStyle(color: Color(bg)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Color(bg))),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Color(bg))),
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
        color: Color(bg),
        child: Text(
          "Update",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
        onPressed: () {},
      ),
    );
  }
}
