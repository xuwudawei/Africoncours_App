import 'package:flutter/material.dart';

var color = 0xFF784ADE;

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Security'),
        backgroundColor: Color(color),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.vpn_key),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text("Change Password"),
              onTap: () {
                Navigator.of(context).pushNamed(
                    '/student/settings/changepassword'); //change passowrd page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text("Change Phone Number"),
              onTap: () {
                Navigator.of(context).pushNamed(
                    '/student/settings/changephonenumber'); //change number page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text("Change Email"),
              onTap: () {
                Navigator.of(context).pushNamed(
                    '/student/settings/changeemail'); //change email page
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
