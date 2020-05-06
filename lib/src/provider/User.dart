import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  Map<String, dynamic> _UserInfo = {
    "firstname": "",
    "lastname": "",
    "email": "",
    "avatar": "",
    "current_address": "",
    "permanent_address": "",
    "country": "",
    "phone": "",
    "type": "",
    "logged": false,
    "starting": 0,
    "ending": 0,
  };

  Map<String, dynamic> get getUserInfo => _UserInfo;
  void setUserInfo(Map<String, dynamic> data) {
    print(data);
    _UserInfo = {..._UserInfo, ...data};
    print("\n\n");
    print(_UserInfo);
    notifyListeners();
  }
}
