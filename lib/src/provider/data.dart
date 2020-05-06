import 'package:flutter/material.dart';
import '../models/userDetails.dart';
import '../models/news.dart';

// App state
class AppState with ChangeNotifier {
  List<User> _students = [];
  List<News> _news = [];
  User _userInfo = User(email: "", lastname: "", firstname: "");

  // Get User Student info
  User get userInfo => _userInfo;

  // Get All students
  List<User> get students {
    return [..._students];
  }

  // Get All news
  List<News> get news {
    return [..._news];
  }

  // Notification
  void loginStudent(User std) {
    notifyListeners();
  }
}
