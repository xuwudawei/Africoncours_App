import 'dart:convert';
import 'dart:io';

import '../urls.dart' as URLS;
import 'package:http/http.dart' as http;

class ChangePass {
  String id;
  String token;
  Map password;
  ChangePass({this.id, this.token, this.password});
  Future<Map> changePass() async {
    try {
      var updated = await http.put(
        '${URLS.environment == "production" ? URLS.url[1] : URLS.url[0]}/user/user/update/password/$id',
        body: json.encode(password),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "auth-token": token
        },
      );
      print(json.decode(updated.body));
      return json.decode(updated.body);
    } catch (err) {
      return {"error": true};
    }
  }
}
