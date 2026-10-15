import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../core/static.dart';
class Apicall {

  // ?q=tesla&from=2026-09-15
  // &sortBy=publishedAt
  // &apiKey=55c38aa5e5b34e72895908bfe55f6342

  getnewsapidata()async{
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
    }catch(e){
      if (kDebugMode){
        print(e);
      }
    }

  }
}

extension on Future<http.Response> {
  Object? get body => null;
}