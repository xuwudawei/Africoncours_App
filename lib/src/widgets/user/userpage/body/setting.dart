import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text("Account Security"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/account/security');
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text("Notifications"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/account/notifications');
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text("Privacy"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/settings/privacy');
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text("About"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/settings/about');
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text("Help & Feedback"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/settings/help');
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text("Africoncours Services"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/settings/services');
            },
          ),
          Divider(),
        ],
      ),
      data: Theme.of(context).copyWith(
        primaryColor: Color.fromRGBO(37, 211, 102, 1),
      ),
    );
  }
}
