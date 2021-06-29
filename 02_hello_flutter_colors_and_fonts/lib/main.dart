import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'My App 02',
              style: TextStyle(  //在文字後加這個就能改變文字的樣式參數
                  fontSize: 30
              ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,  //背景顏色
        ),
        body: Center(
          child: Text(
              'Hello World',
              style: TextStyle(
                fontSize: 50,   //文字大小
                fontWeight: FontWeight.bold,   //粗細
                letterSpacing: 5,  //文字間距
                color: Colors.blueAccent,  //文字顏色
                fontFamily: 'RaleWay',  //文字名稱
              ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Text('click'),
          backgroundColor: Colors.green,
        ),
      ),
    )
);