import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Home(),
    )
);



class Home extends StatelessWidget {
  @override   //原本StatelessWidget也有他的建構函數，下面將其複寫掉
  Widget build(BuildContext context) {   //複寫的建構函數
    return Scaffold(  //把主體放在return這，可達到存檔就會更新的動態熱重載
      appBar: AppBar(
        title: Text(
          'My App 08',
          style: TextStyle(  //在文字後加這個就能改變文字的樣式參數
              fontSize: 30
          ),
        ),
        centerTitle: true, //標題置中
        backgroundColor: Colors.amber,  //背景顏色
      ),

      //--------------主要更動處------------------

      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.cyan,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.pinkAccent,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.amber,
              child: Text('3'),
            ),
          ),
        ],
      ),

      //--------------------------------



      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('click'),
        backgroundColor: Colors.green,
      ),
    );
  }
}




