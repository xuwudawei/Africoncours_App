import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import '../../../provider/User.dart';
import '../../../request/userInfoUpdate.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Second extends StatefulWidget {
  final Map data;
  Second({Key key, @required this.data}) : super(key: key);
  @override
  _SecondState createState() => _SecondState(data);
}

class _SecondState extends State<Second> {
  final formKey = GlobalKey<FormState>();
  Map data;
  Country _selected = Country.GH;
  Country _countryNum = Country.GH;
  Country _emergencyNum = Country.GH;

  String current_address;
  String permanent_address;
  String contact_number;
  String emergency_contact;

  bool clickedSubmit = false;

  var validatePhone = null;
  var validateEmergencyNumber = null;

  _SecondState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete your Profile'),
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
                  "Contacts Info",
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                countryPick(context),
                SizedBox(
                  height: 10,
                ),
                currentAddress(context),
                SizedBox(
                  height: 10,
                ),
                permanentAddress(context),
                SizedBox(
                  height: 10,
                ),
                telephone(context),
                SizedBox(
                  height: 10,
                ),
                emergencyContact(context),
                SizedBox(
                  height: 20,
                ),
                next(context),
                SizedBox(
                  height: 8,
                ),
                (clickedSubmit == true ? loadingWidget() : Text(""))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget countryPick(context) {
    return Row(children: <Widget>[
      Flexible(
        fit: FlexFit.tight,
        child: Container(
          height: 50,
          child: Text(
            "Country of Residence",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(220, 20, 47, 0.7),
            ),
            // borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        child: CountryPicker(
          dense: false,
          showFlag: true, //displays flag, true by default
          showDialingCode: false, //displays dialing code, false by default
          showName: true, //displays country name, true by default
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
    ]);
  }

  Widget currentAddress(context) {
    return Theme(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "current address",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "current",
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
        onSaved: (current) {
          current_address = current;
        },
      ),
      data: Theme.of(context)
          .copyWith(primaryColor: Color.fromRGBO(220, 20, 47, 0.7)),
    );
  }

  Widget permanentAddress(context) {
    return Theme(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "permanent address",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "permanent address",
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
        onSaved: (permanent) {
          permanent_address = permanent;
        },
      ),
      data: Theme.of(context).copyWith(
        primaryColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
    );
  }

  Widget telephone(context) {
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
                _countryNum = country;
              });
            },
            selectedCountry: _countryNum,
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Theme(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 9,
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
                if (value.length < 10) {
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

  Widget emergencyContact(context) {
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
                _emergencyNum = country;
              });
            },
            selectedCountry: _emergencyNum,
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Theme(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 9,
              decoration: InputDecoration(
                labelText: "emergence contact",
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
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              onSaved: (emergency) {
                emergency_contact = emergency;
              },
              autovalidate: true,
              validator: (value) {
                return validateEmergencyNumber;
              },
              onChanged: (value) {
                if (value.length < 10) {
                  setState(() {
                    validateEmergencyNumber = "please provide 10 digits";
                  });
                } else {
                  setState(() {
                    validateEmergencyNumber = null;
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

  Widget loadingWidget() {
    return Center(
      child: Loading(
        color: Colors.pink,
        indicator: BallSpinFadeLoaderIndicator(),
        size: 50,
      ),
    );
  }

  Widget next(context) {
    final userInfo = Provider.of<UserInfoProvider>(context);
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        color: Color.fromRGBO(220, 20, 47, 0.7),
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'serif',
          ),
        ),
        onPressed: () {
          formKey.currentState.save();
          if (formKey.currentState.validate()) {
            setState(
              () {
                clickedSubmit = true;
              },
            );
            data = {
              ...data,
              "country": _selected.name,
              "current_address": current_address,
              "permanent_address": permanent_address,
              "phone": _countryNum.dialingCode + contact_number,
              "emerge_contact": _emergencyNum.dialingCode + emergency_contact
            };
            Update update = Update(
              id: userInfo.getUserInfo["_id"],
              upDateInfo: data,
              token: userInfo.getUserInfo["auth_token"],
            );
            // print(userInfo.getUserInfo["_id"]);

            Future<Map> updatedInfo = update.update();
            updatedInfo.then(
              (value) async {
                // print(onValue);
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool("logged", value["logged"]);
                pref.setString("firstname", value["firstname"]);
                pref.setString("lastname", value["lastname"]);
                pref.setString("email", value["email"]);
                pref.setString("avatar", value["avatar"]);
                pref.setString("auth-token", value["auth-token"]);
                pref.setString("id", value["_id"]);
                userInfo.setUserInfo(value);
              },
            );
            setState(() {
              clickedSubmit = false;
            });
            formKey.currentState.reset();
            Navigator.of(context).pushNamed('/user/page');
            print(data);
          }
        },
      ),
    );
  }
}
