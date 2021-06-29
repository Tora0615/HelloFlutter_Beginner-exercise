import 'package:flutter/material.dart';
//import 'pages/home.dart';  //依照相對路徑引入
import 'package:hello_flutter_worldtime_app_15/pages/home.dart';
//從專案為根目錄開始來引入，優點為可以引入不同專案的東西

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


