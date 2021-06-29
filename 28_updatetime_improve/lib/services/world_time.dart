import 'package:http/http.dart'; //Http
import 'dart:convert';  //json格式轉換用
import 'package:intl/intl.dart';


class WorldTime {

  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint


  /*------------更動部分------------*/
  //bool isDaytime; //原本
  int timeInterval;  //增加時間區間變數
  /*------------------------------*/


  WorldTime({this.location,this.flag,this.url});




  /*------------更動部分------------*/
  //Future<void> getTime() async{
  Future<bool> getTime() async{  //新增回傳值
  /*------------------------------*/

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      /*------------更動部分------------*/
      //isDaytime = now.hour > 6 && now.hour < 20 ? true : false; //原本的早6~晚8

      //判斷現在位於四個時間區間的哪一個
      if(now.hour >= 4 && now.hour < 8){
        timeInterval = 1;  //清晨
      }else if(now.hour >= 8 && now.hour < 16){
        timeInterval = 2 ; //白天
      }else if(now.hour >= 16 && now.hour < 20){
        timeInterval = 3 ; //日落
      }else if(now.hour >= 20 || now.hour < 4){
        timeInterval = 4 ; //晚上
      }
      /*------------------------------*/

      time = DateFormat.jm().format(now); //intl的format方式

      /*------------更動部分------------*/
      return true;  //回傳是否有正確取得時間
      /*------------------------------*/

    }catch(e){
      print('catch error : $e');
      time = 'Something Error...';

      /*------------更動部分------------*/
      return false;  //回傳是否有正確取得時間
      /*------------------------------*/
    }


  }


}