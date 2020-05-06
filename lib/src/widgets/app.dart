import 'package:flutter/material.dart';
import '../provider/User.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/routes.dart';
import '../provider/data.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // SharedPreferences prefs;
  // Map info = {};
  bool logged = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // getLoggedData();
  //   print(info);
  // }

  // getLoggedData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (pref.getBool("logged") == true) {
  //     setState(() {
  //       logged = true;
  //     });
  //   }
  // }

  // getLoggedData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (pref.getBool("logged") == true) {
  //     setState(
  //       () {
  //         logged = true;
  //         info = {
  //           "firstname": pref.getString("firstname"),
  //           "lastname": pref.getString("lastname"),
  //           "email": pref.getString("email"),
  //           "avatar": pref.getString("avatar"),
  //           "school": pref.getString("school"),
  //           "current_address": pref.getString("current_address"),
  //           "permanent_address": pref.getString("permanent_address"),
  //           "country": pref.getString("country"),
  //           "phone": pref.getString("phone"),
  //           "type": "",
  //           "logged": true,
  //           "isStudentAdmin": pref.getBool("isStudentAdmin"),
  //           "starting": pref.getString("starting"),
  //           "ending": pref.getString("ending"),
  //         };
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppState(),
          ),
          ChangeNotifierProvider(
            create: (_) => UserInfoProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: logged ? '/user/page' : '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
