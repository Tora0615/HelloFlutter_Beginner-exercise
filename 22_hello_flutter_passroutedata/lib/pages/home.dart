import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*------------更動部分------------*/
  //在class初始化時創一個可以接受Map格式的data
  Map data = {};
  /*------------------------------*/

  @override
  Widget build(BuildContext context) {

    /*------------更動部分------------*/
    data = ModalRoute.of(context).settings.arguments;  //資料接收
    print(data);  //測試是否有接收到
    /*------------------------------*/

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(Icons.edit_location),
                      label: Text('Edit Location')),
                ],
              )
            ],
          )
      ),
    );
  }
}
