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
          'My App 07',
          style: TextStyle(  //在文字後加這個就能改變文字的樣式參數
              fontSize: 30
          ),
        ),
        centerTitle: true, //標題置中
        backgroundColor: Colors.amber,  //背景顏色
      ),

      //--------------主要更動處------------------
      //東西放在row裡面，是由左到右排

      // --- row 最基本樣式 ---
      /*body: Row(
        children: <Widget>[

        ],
      ),*/

      // --- row 範例 ---
      /*body: Row(
        children: <Widget>[ //可放好幾個子項目
          Text('SomeWords'),
          FlatButton(
              onPressed: (){},
              child: Text('This is Button'),
              color: Colors.red,
          ),
          Container(
            color: Colors.purple, 
            padding: EdgeInsets.all(20),  //如果沒有padding，容器不會顯現出來
            child: Text('This is container'),  //如果沒有child，他範圍會上下佔滿整個螢幕
          )
        ],
      ),*/


      // --- row 範例 + 對齊 ---
      //對齊參數 :
      //mainAxisAlignment : 主要軸對準
      //crossAxisAlignment : 交叉軸對準
      //start : 向開頭處對齊，無間隔
      //center : 向正中間對齊，無間隔
      //end : 向結束處對齊，無間隔
      //spaceAround : 每個元素周圍一樣寬，因此頭尾會比較窄
      //spaceEvenly : 每個間隔都相同
      //spaceBetween : 頭尾到底，中間平分
      //stretch：讓children填滿 '交叉軸' 方向；

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ //可放好幾個子項目
          Text('SomeWords'),
          FlatButton(
            onPressed: (){},
            child: Text('This is Button'),
            color: Colors.red,
          ),
          Container(
            color: Colors.purple,
            padding: EdgeInsets.all(20),  //如果沒有padding，容器不會顯現出來
            child: Text('This is container'),  //如果沒有child，他範圍會上下佔滿整個螢幕
          )
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




