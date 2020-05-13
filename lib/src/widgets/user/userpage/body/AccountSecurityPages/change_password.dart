import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../../../provider/User.dart';
import '../../../../../request/changePasword.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  var valipPassword = null;
  var validComPass = "";
  var savedPass = "";

  final formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  var passwords;
  var confirmPassword;
  bool isLoading = false;

  final passwordValidator = MultiValidator([
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  var validateComfirmPass = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text('Change'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
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
                  "Change Password",
                  style: TextStyle(fontFamily: 'serif', fontSize: 30.0),
                ),
                SizedBox(
                  height: 40,
                ),
                password(context),
                SizedBox(
                  height: 10,
                ),
                confirmpassword(context),
                SizedBox(
                  height: 10,
                ),
                savechanges(context),
                SizedBox(
                  height: 10,
                ),
                ((isLoading == true ? loadingWidget() : Text("")))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget password(context) {
    return TextFormField(
      obscureText: true,
      controller: _pass,
      decoration: InputDecoration(
          hintText: "******",
          labelText: "New Password",
          labelStyle: TextStyle(
            color: Color.fromRGBO(220, 20, 47, 0.7),
          ),
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
        this.passwords = password;
      },
      autovalidate: true,
      validator: (password) => valipPassword,
      onChanged: (password) {
        setState(() {
          valipPassword = passwordValidator(password);
          savedPass = password;
        });
      },
    );
  }

  Widget confirmpassword(context) {
    return TextFormField(
      controller: _confirmPass,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "******",
          labelText: "Confirm New Password",
          labelStyle: TextStyle(
            color: Color.fromRGBO(220, 20, 47, 0.7),
          ),
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
        this.confirmPassword = password;
      },
      autovalidate: true,
      validator: (password) {
        if (password != _pass.text) {
          return "password mismatch";
        }
        return null;
      },
    );
  }

  Widget savechanges(context) {
    final studentInfo = Provider.of<UserInfoProvider>(context);
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        color: Color.fromRGBO(220, 20, 47, 0.7),
        child: Text(
          "Update",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
        onPressed: () async {
          formKey.currentState.save();
          //changes will be made here in the backend;
          if (formKey.currentState.validate()) {
            setState(() {
              this.isLoading = true;
            });
            ChangePass change = ChangePass(
              id: studentInfo.getUserInfo["_id"],
              token: studentInfo.getUserInfo["auth_token"],
              password: {"password": passwords},
            );
            var updated = await change.changePass();
            studentInfo.setUserInfo(updated);
            setState(
              () {
                this.isLoading = false;
              },
            );
            formKey.currentState.reset();
            _confirmPass.text = "";
            _pass.text = "";
            showSnackBar();
            // setState(() {
            //   validateComfirmPass = true;
            // });
          }
        },
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

  showSnackBar() {
    final snackbar = new SnackBar(
      duration: new Duration(seconds: 3),
      backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      content: Text(
        "Password Updated Successfully",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }
}
