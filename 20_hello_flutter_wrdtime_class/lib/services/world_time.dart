import 'package:http/http.dart'; //Http
import 'dart:convert';  //json格式轉換用

class WorldTime {

  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({this.location,this.flag,this.url});


//  void getTime() async{
//    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
//    Map data = jsonDecode(response.body);
//    String datetime = data['utc_datetime'];
//    String offset = data['utc_offset'].substring(1,3);
//
//    DateTime now = DateTime.parse(datetime);
//    now = now.add(Duration(hours: int.parse(offset)));
//
//    time = now.toString();
//
//  }



  //choose_location.dart 的 setupWorldTime() 要用 async &  await ， 因此要這樣改
  Future<void> getTime() async{
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();

  }


}