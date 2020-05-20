import 'package:flutter/material.dart';
import 'package:preferences/preference_page.dart';
import 'package:preferences/preferences.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
      ),
      body: PreferencePage([
        PreferenceTitle('Manage Notifications'),
        SwitchPreference(
          'New Message Alerts',
          'notification_nm_alerts',
          switchActiveColor: Color.fromRGBO(37, 211, 102, 1),
          defaultVal: true,
          onEnable: () async {
            //send a request to the backend
            await Future.delayed(Duration(seconds: 1));
          },
          onDisable: () async {
            //send a request to the backend
            await Future.delayed(Duration(seconds: 1));
            throw Exception('No Connection');
          },
        ),
        PreferenceTitle('Private Messages'),
        SwitchPreference(
          'Private Messages from Friends',
          'notificatons_pm_friend',
          switchActiveColor: Color.fromRGBO(37, 211, 102, 1),
          defaultVal: true,
          onEnable: () async {
            //send a request to the backend
            await Future.delayed(Duration(seconds: 1));
          },
          onDisable: () async {
            //send a request to the backend
            await Future.delayed(Duration(seconds: 1));
            throw Exception('No Connection');
          },
        ),
        SwitchPreference(
          'Private Messages from Strangers',
          'notificatons_pm_stranger',
          switchActiveColor: Color.fromRGBO(37, 211, 102, 1),
          defaultVal: true,
          onEnable: () async {
            //send a request to the backend
            await Future.delayed(Duration(seconds: 1));
          },
          onDisable: () async {
            //send a request to the backend
            await Future.delayed(Duration(seconds: 1));
            throw Exception('No Connection');
          },
        ),
      ]),
    );
  }
}
