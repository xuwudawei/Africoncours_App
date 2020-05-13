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
        title: Text('Settings'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
      body: PreferencePage([
        PreferenceTitle('Manage Notifications'),
        SwitchPreference(
          'New Message Alerts',
          'notification_nm_alerts',
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
