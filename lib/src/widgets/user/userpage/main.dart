import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../provider/User.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Various bottom navigation pages
import 'body/homepage.dart';
import 'body/news.dart';
import 'body/setting.dart';
import 'body/BottomNavJobs.dart';

// Drawer import
import 'body/userDrawer.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // @override
  // Map info = {};
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLoggedData();
  // }

  // getLoggedData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(
  //     () {
  //       info = {
  //         "firstname": pref.getString("firstname"),
  //         "lastname": pref.getString("lastname"),
  //         "email": pref.getString("email"),
  //         "avatar": pref.getString("avatar"),
  //         "school": pref.getString("school"),
  //         "current_address": pref.getString("current_address"),
  //         "permanent_address": pref.getString("permanent_address"),
  //         "country": pref.getString("country"),
  //         "phone": pref.getString("phone"),
  //         "type": "",
  //         "logged": true,
  //         "isStudentAdmin": pref.getBool("isStudentAdmin"),
  //         "starting": pref.getString("starting"),
  //         "ending": pref.getString("ending"),
  //       };
  //     },
  //   );
  // }

  var selectedNav = 0;
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfoProvider>(context);
    // userInfo.setUserInfo();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                key: Key("logout"),
                value: "logout",
                child: GestureDetector(
                  child: Text('Logout'),
                  onTap: () {
                    print("Logout");
                  },
                ),
              ),
              PopupMenuItem(
                key: Key("settings"),
                value: "settings",
                child: Text('Settings'),
              ),
            ],
            icon: Consumer<UserInfoProvider>(
              builder: (context, user, child) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(user.getUserInfo["avatar"]),
                );
              },
            ),
            onSelected: (value) {
              if (value == "settings") {
                Navigator.of(context).pushNamed('/user/sidemenu/settings');
              } else {
                // Navigator.of(context).popUntil(ModalRoute.withName('/login'));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/user/login', ModalRoute.withName('/useroption'));
              } // log the user out at the back end
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: UserDrawer(),
      ),
      body: [Homepage(), Ongoing(), BottomNavJobs(), Settings()]
          .elementAt(selectedNav),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(37, 211, 102, 1),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                title: Text("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Contests"),
                icon: Icon(FontAwesomeIcons.newspaper)),
            BottomNavigationBarItem(
                title: Text("Jobs"), icon: Icon(Icons.event_note)),
            BottomNavigationBarItem(
                title: Text("settings"), icon: Icon(Icons.settings))
          ],
          onTap: (index) {
            setState(() {
              selectedNav = index;
            });
          },
          currentIndex: selectedNav,
        ),
      ),
    );
  }
}
