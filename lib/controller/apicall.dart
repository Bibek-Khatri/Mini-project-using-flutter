import 'dart:convert' as convert;

import 'package:miniflutterproject/core/static.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/news.dart';

class Apicall {
  static Future<news?>? getnewsapidata() async {
    try {
      var url = Uri.https(Static.baseurl, Static.path, {
        'q': 'apple',
        'sortBy': 'popularity',
        'apiKey': Static.apikey,
      });

      var response = await http.get(url);

      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        var jsonResponse = convert.jsonDecode(response.body);
        var data = news.fromJson(jsonResponse);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}