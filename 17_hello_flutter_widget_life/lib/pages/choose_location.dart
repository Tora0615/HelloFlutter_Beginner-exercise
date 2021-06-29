import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  /*------更動部分------*/
  int count=0;

  @override
  void initState() {
    print('----- 按下了 Edit Location 按鈕 -----');
    print('initState() Called');
    super.initState();
  }
  /*------------------*/

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


      /*------更動部分------*/
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
      /*------------------*/
    );
  }

  /*------更動部分------*/
  @override
  void deactivate() {
    print('----- 按下了 返回上一頁 的按鈕 -----');
    print('deactivate() Called');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose() Called');
    super.dispose();
  }
  /*------------------*/
}
