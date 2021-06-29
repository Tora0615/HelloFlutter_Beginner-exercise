import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';


void main() {
  runApp(MaterialApp(

    //initialRoute: '/home',  //原本的
    initialRoute: '/',  //初始化頁面

    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}


