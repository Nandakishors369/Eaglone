import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String ytKey = "AIzaSyCCUWWRMsXqtnAgbRlMUFy9nvsG_Cu6vTA";
const plId = 'PLptHs0ZDJKt_fLp8ImPQVc1obUJKDSQL7';
const baseUrl = 'www.googleapis.com';

Future getvideolist() async {
  Map<String, dynamic> parameters = {
    'part': 'snippet,contentDetails',
    'id': plId,
    'key': ytKey,
  };
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Uri uri = Uri.https(baseUrl, 'youtube/v3/playlistItems', parameters);

  Response response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    log(response.body);
  } else {
    log("Some thing went wrong");
  }
}

Future postSignup() async {
  var url = Uri.parse("http://192.168.66.136:3000/sign-up");

  Map<String, dynamic> body = {
    "name": "hello",
    "mobile": "hello",
    "email": "123",
    "pass": "789"
  };

  Map<String, String> headers = {
    "api-key":
        "bearer \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
  };
  String jsonString = jsonEncode(body);

  try {
    log("post api");
    Response response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      log("post method is working");
      log(response.body);
    } else {
      log("post method is not working");
      throw Exception();
    }
  } catch (e) {
    log("this is the exception : $e");
    throw Exception();
  }
}
