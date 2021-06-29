import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Map data = {};


  @override
  Widget build(BuildContext context) {


    data = ModalRoute.of(context).settings.arguments;  //資料接收
    //print(data);  //測試是否有接收到

    /*------------更動部分------------*/
    String bgImage = data['isDaytime'] ? 'day' : 'night' ;
    Color wordColor = data['isDaytime'] ? Colors.black87 : Colors.white ;
    /*------------------------------*/

    return Scaffold(
      /*------------更動部分------------*/
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$bgImage.jpg',),
            fit: BoxFit.cover,
          ),
        ),
        /*------------------------------*/


        child: Column(
          children: <Widget>[
            SizedBox(height: 110,),
            FlatButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                    Icons.edit_location,
                    color: wordColor,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: wordColor,
                  ),
                )
            ),
            SizedBox(height: 170,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    color: wordColor,
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
                color: wordColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
