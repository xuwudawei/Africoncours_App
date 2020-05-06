import 'package:flutter/material.dart';

class SideMenuSettings extends StatefulWidget {
  @override
  _SideMenuSettingsState createState() => _SideMenuSettingsState();
}

class _SideMenuSettingsState extends State<SideMenuSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
        title: Text('Settings'),
      ),
      body: Column(
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
            title: Text("Chats"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/settings/chats');
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
    );
  }
}
