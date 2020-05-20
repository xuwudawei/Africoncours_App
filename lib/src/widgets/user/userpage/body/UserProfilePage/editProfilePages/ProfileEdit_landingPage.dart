import 'package:flutter/material.dart';

class ProfileEditMainPage extends StatefulWidget {
  @override
  _ProfileEditMainPageState createState() => _ProfileEditMainPageState();
}

class _ProfileEditMainPageState extends State<ProfileEditMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.message),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text("Edit User Information"),
              onTap: () {
                Navigator.of(context).pushNamed(
                    '/user/profile/Edit/editUserInformation'); //change User Information Page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.insert_photo),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text("Change Profile Picture"),
              onTap: () {
                Navigator.of(context).pushNamed(
                    '/user/profile/Edit/changeProfilePicture'); //change Profile Picture page
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
