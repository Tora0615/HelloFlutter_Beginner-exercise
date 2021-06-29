import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  if (Platform.isAndroid) {  //狀態欄透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,  //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',  //初始化頁面
    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}


