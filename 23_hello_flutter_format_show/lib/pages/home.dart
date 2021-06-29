import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Map data = {};


  @override
  Widget build(BuildContext context) {

    /*------------更動部分------------*/
    data = ModalRoute.of(context).settings.arguments;  //資料接收
    print(data);  //測試是否有接收到
    /*------------------------------*/

    return Scaffold(
      body: SafeArea(

          /*------------更動部分------------*/
          child: Column(
            children: <Widget>[
              SizedBox(height: 120,),

              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location')
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  letterSpacing: 2,
                ),
              ),

            ],
          )
          /*------------------------------*/

      ),
    );
  }
}
