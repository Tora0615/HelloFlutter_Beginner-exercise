
import 'package:flutter/material.dart';
import 'quote.dart';  //要先引用dart file

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

  /*----------- 有更動部分 -------------*/
  // List<String> quotes --改成--> List<Quote> quotes
  List<Quote> quotes = [
    Quote(author: 'Person A',text: '人被殺，就會死',),
    Quote(author: 'Person B',text: '在非洲，每過去一分鐘，就會失去60秒',),
    Quote(author: 'Person C',text: '如果晚上走在路上覺得背後涼涼的，請記得把衣服穿上',),
  ];
  /*----------------------------------*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('My App 11 - 幹話語錄 & Custom Classes'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        /*----------- 有更動部分 -------------*/
        //children: quotes.map((e) => Text(e)).toList(), //原本長這樣
        children: quotes.map((e) => Text('${e.text} - ${e.author}')).toList(),
        //說明 :
        //從quotes這個List中迭代傳入的元素長相如下 :
        //Quote(author: 'Person A',text: '人被殺，就會死',),)
        //取其中的值要以 e.text & e.author 來取
        //
        //至於為甚麼長這樣 : '${}'
        //原因是若要在字串中傳入參數，要用$字符號還呼叫變數(變數 : e.text)
        //至於為什麼要有 : {}
        //是因為e.text太長，只用'$e.text'會有錯誤，所以要括號起來變'${e.text}'
        //如果平常變數短短的，可以直接用'$變數'
        /*------------------------------------*/

      ),
    );
  }
}