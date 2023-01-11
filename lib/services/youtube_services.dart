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
