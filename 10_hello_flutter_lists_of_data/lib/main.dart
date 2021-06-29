
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<String> quotes = [
    '人被殺，就會死',
    '在非洲，每過去一分鐘，就會失去60秒',
    '如果晚上走在路上覺得背後涼涼的，請記得把衣服穿上',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('My App 10 - 幹話語錄'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: quotes.map((e) => Text(e)).toList(),
        ),
    );
  }
}


/*
quotes.map((e) => Text(e)).toList(),
本行程式碼功能為 :
將名為quotes的List，迭代顯示出來

其等同於下方這程式碼區段
quotes.map((e){
  return Text(e)
}).toList(),

細項說明 :
1. map函數是用來進行迭代的
2. (e) => Text(e)是個函式 : 輸入由e接收，再將e回傳
3. toList()將東西轉回List，不然資料印出來會長 : ['xxx','xxx','xxx']

(心中碎碎念 : 明明原本就是List了，為啥要那麼弄啦)
*/


