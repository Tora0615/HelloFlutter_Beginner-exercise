import 'package:http/http.dart'; //Http
import 'dart:convert';  //json格式轉換用


import 'package:intl/intl.dart';


class WorldTime {

  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});





  Future<void> getTime() async{


    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //三元運算子 : condition ? a : b  // condition為true -> return a
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false; //早6~晚8

      time = DateFormat.jm().format(now); //intl的format方式

    }catch(e){
      print('catch error : $e');
      time = 'Something Error...';
    }


  }


}