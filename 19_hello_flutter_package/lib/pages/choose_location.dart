import 'package:flutter/material.dart';

/*------------更動部分------------*/
import 'package:http/http.dart'; //Http
import 'dart:convert';  //json格式轉換用
/*------------------------------*/

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count=0;

  /*------------更動部分------------*/
  void getTime() async{
   Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Taipei');
    Map data = jsonDecode(response.body);  //要注意是map這個變數形式
    //print('--- data ---');
    //print(data);

    //註 : 與教學影片不同的地方是用 utc_datetime 才需要+8，為了練習就改成這樣了
    String datetime = data['utc_datetime']; //長這樣 : 2020-08-20T09:10:04.085988+00:00
    //String offset = data['utc_offset'];  //長這樣 : +08:00
    String offset = data['utc_offset'].substring(1,3);
    //會將+08:00從左邊數來，第一個到第三個以前的數字留起來(即08)(最左為第0個)

     print('--- datetime ---');
     print(datetime);
     print('--- offset_substring ---');
     print(offset);

    //DateTime 應該是內建的時間格式變數 / parse 意思 : 解析
    DateTime now = DateTime.parse(datetime); //長這樣 : 2020-08-20 09:10:04.085988z
    now = now.add(Duration(hours: int.parse(offset)));
    print('--- now ---');
    print(now);

  }
  /*------------------------------*/

  @override
  void initState() {
    print('----- 按下了 Edit Location 按鈕 -----');
    print('initState() Called');
    super.initState();
    getTime();  //初始化的時候去Get Url return
  }

  @override
  Widget build(BuildContext context) {
    print('build() Called');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,  //appbar陰影
      ),
      body: RaisedButton(
          onPressed: (){
            setState(() {
              count+=1;
              print('----- 按下了 Counter 按鈕 -----');
              print('Button Pressed');
            });
          },
        child: Text('Counter is $count'),
      ),
    );
  }


}
