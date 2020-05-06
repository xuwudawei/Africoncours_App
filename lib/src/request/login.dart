import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../src/urls.dart' as URLS;
import 'package:http/http.dart' as http;

class Login {
  String email;
  String password;
  Login({this.email, this.password});
  Future<Map> login() async {
    print(json.encode({"email": this.email, "password": this.password}));
    var data = await http.post(
      '${URLS.environment == "production" ? URLS.url[1] : URLS.url[0]}/user/student/login',
      body: json.encode({"email": email, "password": password}),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    return json.decode(data.body);
  }
}
