import 'package:http/http.dart'; //Http
import 'dart:convert';  //json格式轉換用

class WorldTime {

  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({this.location,this.flag,this.url});




  Future<void> getTime() async{

//      Response response = await get('http://worldtimeapi.org/api/timezonesssss/$url');  //模擬error
//      Map data = jsonDecode(response.body);
//      String datetime = data['utc_datetime'];
//      String offset = data['utc_offset'].substring(1,3);
//
//      DateTime now = DateTime.parse(datetime);
//      now = now.add(Duration(hours: int.parse(offset)));
//
//      time = now.toString();


    /*------------更動部分------------*/
    try{
      Response response = await get('http://worldtimeapi.org/api/timezonesssss/$url');  //模擬error
      Map data = jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();
    }catch(e){
      print('catch error : $e');
      time = 'Something Error...';
    }
  /*------------------------------*/

  }


}