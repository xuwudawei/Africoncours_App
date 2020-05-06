import 'package:flutter/material.dart';
import 'package:flutter_country_picker/country.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import '../../../../../provider/User.dart';
import '../../../../../request/userInfoUpdate.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class ChangePhoneNumber extends StatefulWidget {
  @override
  _ChangePhoneNumberState createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  final formKey = GlobalKey<FormState>();
  Country _selected = Country.GH;
  var phonenumber = null;

  bool isLoading = false;

  var validatePhone = null;
  var contact_number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
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
                  "Change Phone Number",
                  style: TextStyle(fontFamily: 'serif', fontSize: 25.0),
                ),
                SizedBox(
                  height: 40,
                ),
                number(context),
                SizedBox(
                  height: 30,
                ),
                update(context),
                (isLoading == true ? loadingWidget() : Text(""))
              ],
            ),
          ))),
    );
  }

  Widget number(context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: CountryPicker(
            dense: false,
            showFlag: true, //displays flag, true by default
            showDialingCode: true, //displays dialing code, false by default
            showName: false, //displays country name, true by default
            showCurrency: false, //eg. 'British pound'
            showCurrencyISO: false, //eg. 'GBP'
            onChanged: (Country country) {
              setState(() {
                _selected = country;
              });
            },
            selectedCountry: _selected,
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Theme(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "contact",
                hintStyle: TextStyle(fontSize: 25),
                hintText: "0XXXXXXXXX",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(220, 20, 47, 0.7),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(220, 20, 47, 0.7),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              onSaved: (myPhone) {
                contact_number = myPhone;
              },
              autovalidate: true,
              validator: (value) {
                return validatePhone;
              },
              onChanged: (value) {
                if (value.length <= 10) {
                  setState(() {
                    validatePhone = "please provide 10 numbers";
                  });
                } else {
                  setState(() {
                    validatePhone = null;
                  });
                }
              },
            ),
            data: Theme.of(context).copyWith(
              primaryColor: Color.fromRGBO(220, 20, 47, 0.7),
            ),
          ),
        ),
      ],
    );
  }

  Widget update(context) {
    final userInfo = Provider.of<UserInfoProvider>(context);

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
        onPressed: () {
          if (formKey.currentState.validate()) {
            setState(
              () {
                isLoading = true;
              },
            );
            formKey.currentState.save();
            Update changePhone = Update(
              id: userInfo.getUserInfo["_id"],
              token: userInfo.getUserInfo["auth_token"],
              upDateInfo: {"phone": _selected.dialingCode + contact_number},
            );
            Future<Map> updatedInfo = changePhone.update();
            updatedInfo.then((onValue) {
              userInfo.setUserInfo(onValue);
            }).catchError((onError) {
              print(onError);
            });
            setState(() {
              isLoading = false;
            });
            formKey.currentState.reset();
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
}
