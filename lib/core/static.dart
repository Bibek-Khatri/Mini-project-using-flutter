import 'package:miniflutterproject/model/news.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

class Static {
  //static datas
  //https://newsapi.org/
  // v2/everything
  // ?q=apple
  // &sortBy=popularity
  // &apiKey=a25a0c0b883c4f389ff5c23da0f9dfea
  static String baseurl = "newsapi.org";
  static String path = "v2/everything";
  static String apikey = "a25a0c0b883c4f389ff5c23da0f9dfea";



  static Articles? article;

  //datetime formatter
  static datetimeconverter(String value){

    if(value.isEmpty || value == "" || value == " "){
      return "";
    }
    try{
      // datetime format // parse //return string

      DateTime formatt = DateTime.parse(value);
      var formatedateToday = formatt.format('dd-MM-yyyy');
      var formatedate = formatt.toReadable;
      return formatedateToday.toString();
      return formatedate.toString();
    }catch(e){
      return "";
    }






  }

}