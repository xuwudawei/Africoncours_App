import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final formkey = GlobalKey<FormState>();
  String title, grievances;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Feedback'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text(
                "User FeedBack Form",
                style: TextStyle(fontFamily: 'serif', fontSize: 30.0),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Title of Issue",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(220, 20, 47, 0.7),
                      width: 2,
                    ),
                  ),
                ),
                validator: (title) {
                  if (title.length == 0) {
                    return "Please title can't be empty";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  title = val;
                },
                onSaved: (val) {
                  title = val;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                minLines: 8,
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: "Description of Issue",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(220, 20, 47, 0.7),
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (val) {
                  grievances = val;
                },
                validator: (title) {
                  if (title.length == 0) {
                    return "Please enter your grievances";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  grievances = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 50,
                height: 50,
                child: RaisedButton(
                  color: Color.fromRGBO(220, 20, 47, 0.7),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //Grievances will be submitted to the admin here
                    showDoneSnackBar();
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              (_isLoading == true ? loadingWidget() : Text(""))
            ],
          ),
        ),
      ),
    );
  }
}

Widget loadingWidget() {
  return Center(
    child: Loading(
      indicator: BallSpinFadeLoaderIndicator(),
      color: Colors.pink,
      size: 50,
    ),
  );
}

showDoneSnackBar() {
  final snackbar = SnackBar(
    backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
    content: Text(
      "Feedback Submitted",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ),
  );
  _scaffold.currentState.showSnackBar(snackbar);
}
