import 'package:flutter/material.dart';


import 'package:hello_flutter_map_routing_16/pages/home.dart';
import 'package:hello_flutter_map_routing_16/pages/loading.dart';
import 'package:hello_flutter_map_routing_16/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(

    initialRoute: '/home',  //初始化頁面為Home

    //路由表，紀錄什麼名稱對應什麼頁面 (key : value)
    //至於為什麼要寫的像是路徑，則是是因為慣例，這樣在開發時比較好辨別。
    //當然你要命名成a,b,c也是可以... (實測可以動)
    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}


