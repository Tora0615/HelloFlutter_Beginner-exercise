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
          'My App 05',
          style: TextStyle(  //在文字後加這個就能改變文字的樣式參數
              fontSize: 30
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,  //背景顏色
      ),
      body: Center(

//        /*------------- 單純icon -------------*/
//          child: Icon(
//            Icons.android,  //icon樣子
//            color: Colors.purple,  //icon顏色
//            size: 50,  //icon大小
//          )
//        /*-------------------------------------*/

//        /*---------- 單純按鈕(有陰影) ------------*/
//          child: RaisedButton(
//            onPressed: (){},
//            color: Colors.lightBlue,
//            child: Text('This is Text',
//              style: TextStyle(
//                fontSize: 30  //字體大小
//              ),
//            ),
//          )
//        /*--------------------------------------*/


//        /*---------- 單純按鈕(沒有陰影) ------------*/
//          child: FlatButton(
//            onPressed: (){},
//            color: Colors.lightBlue,
//            child: Text('This is Text',
//              style: TextStyle(
//                  fontSize: 30  //字體大小
//              ),
//            ),
//          )
//        /*--------------------------------------*/


        /*------------ 有陰影的按鈕+icon ------------*/
        child: RaisedButton.icon(
          icon: Icon(Icons.ac_unit),  //icon
          label: Text('snow'),  //文字
          color: Colors.amber,  //按鈕背景色
          onPressed: (){  //按下觸發的功能
            print('Clicked');  //在android studio console 印出訊息
          },
        )
        /*------------------------------------------*/

//        /*------------ icon當按鈕 ------------*/
//        child: IconButton(
//          icon: Icon(Icons.ac_unit),  //icon
//          color: Colors.cyan,  //按鈕顏色
//          iconSize: 100,  //icon按鈕的大小
//          onPressed: (){  //按下觸發的功能
//            print('Clicked');  //在android studio console 印出訊息
//          },
//        )
//        /*------------------------------------------*/


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('click'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

