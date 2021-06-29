
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



  List<Quote> quotes = [
    Quote(author: 'Person A',text: '人被殺，就會死',),
    Quote(author: 'Person B',text: '在非洲，每過去一分鐘，就會失去60秒',),
    Quote(author: 'Person C',text: '如果晚上走在路上覺得背後涼涼的，請記得把衣服穿上',),
  ];

  /*----------- 有更動部分 -------------*/
  // 這是名為quoteTemplate的函式，每呼叫一次，會返回一個Card Widget
  Widget quoteTemplate(quoteInput){
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: <Widget>[
            Text(
                quoteInput.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6,),
            Text(
              quoteInput.author,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
  /*----------------------------------*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('My App 12'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        /*----------- 有更動部分 -------------*/
        children: quotes.map((e) => quoteTemplate(e)).toList(),
        /*----------------------------------*/
      ),
    );
  }
}