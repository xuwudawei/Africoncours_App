import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../src/urls.dart' as URLS;

import 'package:http/http.dart' as http;

class Update {
  Map upDateInfo;
  String token;
  String id;
  Update({this.id, this.upDateInfo, this.token});
  Future<Map> update() async {
    var data = await http.put(
      '${URLS.environment == "production" ? URLS.url[1] : URLS.url[0]}/user/user/update/$id',
      body: json.encode(upDateInfo),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "auth-token": token
      },
    );
    return json.decode(data.body);
  }
}
