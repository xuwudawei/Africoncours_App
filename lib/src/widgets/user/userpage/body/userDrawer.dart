import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../provider/User.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: Column(
        children: <Widget>[
          Consumer<UserInfoProvider>(
            builder: (context, user, child) {
              return UserAccountsDrawerHeader(
                accountEmail: Text("xuwudawei@outlook.com"),
                accountName: Text("David Osei Opoku"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/57068034?s=460&u=d7eb15aed461ed917047aa35da504974596034e9&v=4"),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text("Profile"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/sidemenu/profile');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.newspaper),
            title: Text("Ongoing Contest"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/sidemenu/contest/ongoing');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.graduationCap),
            title: Text("Jobs"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/sidemenu/sidemenujobs');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Competitions"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/sidemenu/competitions');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.graduationCap),
            title: Text("Applied Jobs"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/sidemenu/appliedjobs');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.graduationCap),
            title: Text("Applied Competitions"),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/user/sidemenu/appliedCompetitions');
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Messages"),
            onTap: () {
              Navigator.of(context).pushNamed('/user/sidemenu/messages');
            },
            trailing: Chip(
              label: Text(
                "20",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromRGBO(37, 211, 102, 1),
            ),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).pushNamed('/user/sidemenu/settings');
                },
              ),
            ),
          )
        ],
      ),
      data: Theme.of(context).copyWith(
        primaryColor: Color.fromRGBO(37, 211, 102, 1),
      ),
    );
  }
}
