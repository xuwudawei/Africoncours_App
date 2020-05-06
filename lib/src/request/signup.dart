import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../src/urls.dart' as URLS;

class SignUpRequest {
  String firstname;
  String lastname;
  String email;
  String token;
  String password;

  // COnstructor
  SignUpRequest(
      {this.firstname, this.lastname, this.email, this.password, this.token});
  Future<Map> studentSignUp() async {
    var data = await http.post(
        '${URLS.environment == "production" ? URLS.url[1] : URLS.url[0]}/user/student/register/$token',
        body: json.encode({
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "password": password
        }),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    print(json.decode(data.body));
    return json.decode(data.body);
  }
}
