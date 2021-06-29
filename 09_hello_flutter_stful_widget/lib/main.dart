
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}


class ABC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'My App 09 - Stateful Widget Demo',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row( //兩個按鈕
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: (){  //按下按鈕時
                      setState(() {  //重設狀態
                        sum-=1;
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      '-1',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                ),
                SizedBox(width: 10,),
                FlatButton(
                    color: Colors.red,
                    onPressed: (){  //按下按鈕時
                      setState(() {  //重設狀態
                        sum+=1;
                      });
                    },
                    child: Text(
                      '+1',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
                'The Number is $sum',
                style: TextStyle(
                  fontSize: 20,
                ),
            ),
          ],
        ),
      ),
    );
  }
}

