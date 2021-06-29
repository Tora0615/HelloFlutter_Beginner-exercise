import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count=0;

  /*------------更動部分------------*/
/*
  //Flow Chart 01
  //如同開了一個新分支同時來執行
  void getData(){
    print(' --- getData() Started --- ');
    Future.delayed(Duration(seconds: 3),(){
      print(' --- Future getUserName --- ');
    });
    print(' --- getData() Finished --- ');
  }


  //Flow Chart 02
  //如同開了兩個新分支同時來執行
  void getData() {  //兩個future
    print(' --- getData() Started --- ');

    //模擬獲取帳號名稱
    Future.delayed(Duration(seconds: 3),(){
      print(' --- Future getUserName (Use 3 Sec) --- ');
    });
    //模擬獲取個人簡介
    Future.delayed(Duration(seconds: 2),(){
      print(' --- Future getBio (Use 2 Sec) --- ');
    });

    print(' --- getData() Finished --- ');
  }



  //Flow Chart 404
  //只用await，沒用async --> 報錯



  //Flow Chart 03
  //在有標註async的函式中，當遇到await時，就會等待那個目標結束，才會執行async函式中的下一個目標
  //async用一半(上半)
  void getData() async{
    print(' --- getData() Started --- ');

    //模擬獲取帳號名稱
    await Future.delayed(Duration(seconds: 3),(){
      print(' --- Future getUserName (3 Sec) --- ');
    });
    //模擬獲取個人簡介
    Future.delayed(Duration(seconds: 1),(){
      print(' --- Future getBio (1 Sec) --- ');
    });

    print(' --- getData() Finished --- ');
  }





  //Flow Chart 04
  //在有標註async的函式中，當遇到await時，就會等待那個目標結束，才會執行async函式中的下一個目標
  //async用一半(下半)
  void getData() async{
    print(' --- getData() Started --- ');

    //模擬獲取帳號名稱
    Future.delayed(Duration(seconds: 3),(){
      print(' --- Future getUserName (3 Sec) --- ');
    });
    //模擬獲取個人簡介
    await Future.delayed(Duration(seconds: 1),(){
      print(' --- Future getBio (1 Sec) --- ');
    });

    print(' --- getData() Finished --- ');
  }
  */

  //Flow Chart 05
  //用了async也全部都有記得用await
  void getData() async{
    print(' --- getData() Started --- ');

    //模擬獲取帳號名稱
    await Future.delayed(Duration(seconds: 3),(){
      print(' --- Future getUserName --- ');
    });
    //模擬獲取個人簡介
    await Future.delayed(Duration(seconds: 2),(){
      print(' --- Future getBio --- ');
    });

    print(' --- getData() Finished --- ');
  }
  /*------------------------------*/

  @override
  void initState() {
    print('----- 按下了 Edit Location 按鈕 -----');
    print('initState() Called');
    super.initState();

    /*------更動部分------*/
    getData();
    /*------------------*/

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
