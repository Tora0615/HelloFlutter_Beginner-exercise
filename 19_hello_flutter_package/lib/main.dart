import 'package:flutter/material.dart';
import 'package:hello_flutter_package_19/pages/home.dart';
import 'package:hello_flutter_package_19/pages/loading.dart';
import 'package:hello_flutter_package_19/pages/choose_location.dart';


void main() {
  runApp(MaterialApp(

    initialRoute: '/home',  //初始化頁面為Home

    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}


