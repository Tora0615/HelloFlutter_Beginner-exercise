
import 'package:flutter/material.dart';
import 'quote.dart';  //要先引用dart file
import 'quote_card.dart';

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



  List<Quote> quotes = [
    Quote(author: 'Person A',text: '人被殺，就會死',),
    Quote(author: 'Person B',text: '在非洲，每過去一分鐘，就會失去60秒',),
    Quote(author: 'Person C',text: '如果晚上走在路上覺得背後涼涼的，請記得把衣服穿上',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('My App 14'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        /*----------- 有更動部分 -------------*/
        //children: quotes.map((e) => QuoteCard(e)).toList(), //原本樣子
        children: quotes.map((e) => QuoteCard(
            quoteInput: e,
            delete: (){
              setState(() {
                quotes.remove(e);
              });
            },
        )).toList(),
        /*----------------------------------*/
      ),
    );
  }
}






