import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';

/*------------更動部分------------*/  //狀態欄透明相關package
import 'dart:io';
import 'package:flutter/services.dart';
/*------------------------------*/
void main() {

  /*------------更動部分------------*/
  if (Platform.isAndroid) {  //狀態欄透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,  //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  /*------------------------------*/

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


