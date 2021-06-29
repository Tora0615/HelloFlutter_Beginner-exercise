import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Home(),
    )
);

class Home extends StatelessWidget {
  @override   //原本StatelessWidget也有胎的建構函數，下面將其複寫掉
  Widget build(BuildContext context) {   //複寫的建構函數
    return Scaffold(  //把主體放在return這，可達到存檔就會更新的動態熱重載
      appBar: AppBar(
        title: Text(
          'My App 04',
          style: TextStyle(  //在文字後加這個就能改變文字的樣式參數
              fontSize: 30
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,  //背景顏色
      ),
      body: Center(
        child:Image(
          //image: NetworkImage('https://i.imgur.com/SrRVxHh.png'), //網路圖片
          image: AssetImage('assets/IMG_0573.PNG') //本地圖片 (要到pubspec中設定asset路徑)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('click'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

