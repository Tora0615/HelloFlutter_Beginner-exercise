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
          'My App 06',
          style: TextStyle(  //在文字後加這個就能改變文字的樣式參數
              fontSize: 30
          ),
        ),
        centerTitle: true, //標題置中
        backgroundColor: Colors.amber,  //背景顏色
      ),




      /*body:Container(  //只有Container，沒有Child時，其占滿Body所有空間
          color: Colors.black38,
      ),*/
      /*body:Container(  //有child，就只圍繞在child周圍
        color: Colors.black38,
        child: Text('SomeWords'),
      ),*/
        body:Container(
          //------ 說明 -------
          //padding ~ 填充
          //margins ~ 邊距
          //EdgeInsets.all(value), //四邊同值
          //EdgeInsets.fromLTRB(left, top, right, bottom),  //左上右下
          //EdgeInsets.symmetric(vertical: ,horizontal: ),  //symmetric : 對稱的。要指定水平還鉛直

          padding : EdgeInsets.symmetric(vertical: 20,horizontal: 40),
          margin: EdgeInsets.all(20),
          color: Colors.black38,
          child: Text('SomeWords'),
        ),

        /*body: Padding(  //單純 padding 可以只用Padding()，而不用Container()
          padding: EdgeInsets.all(30),
          child: Text('SomeWords'),
          //color & margin 這裡不能用
        ),*/



      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('click'),
        backgroundColor: Colors.green,
      ),
    );
  }
}




