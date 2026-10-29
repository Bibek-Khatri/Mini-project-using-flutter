import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../core/static.dart';
import '../model/News.dart';
class Apicall {

  // ?q=tesla&from=2026-09-15
  // &sortBy=publishedAt
  // &apiKey=55c38aa5e5b34e72895908bfe55f6342

   static Future<news?>?getnewsapidata(dynamic reponse)async{
    try{
      var url = Uri.http(Static.baseurl, Static.path,{

          'q':'apple',
            'sortBy': 'popularity',
            'apikey': Static.apikey
          }
      );
      var response = await http.get(url);
      if (kDebugMode){
        print(response.body);
      }

      if(response.statusCode.toString().contains("20")) {
        var jsonresponse = convert.jsonDecode(reponse.body);
        var data = news.fromJson(jsonresponse);
        return data;
      }
      else{
        return null;
      }

    }catch(e){
      if (kDebugMode){
        print(e);
      }
    }

  }
}

