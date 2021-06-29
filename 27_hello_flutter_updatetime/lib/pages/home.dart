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
    //4. 檢查data是空是滿，空的就用預設地點的資料填入； 滿了就用回傳回來的
    //( 如果沒有做檢查，回傳的data會被預設資料覆蓋 )
    data =  data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;  //資料接收
    /*------------------------------*/

    String bgImage = data['isDaytime'] ? 'day' : 'night' ;
    Color wordColor = data['isDaytime'] ? Colors.black87 : Colors.white ;


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$bgImage.jpg',),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: <Widget>[
            SizedBox(height: 110,),
            FlatButton.icon(

                /*------------更動部分------------*/
                onPressed: () async {
                  //1. result 接受回傳 (動態資料型態)
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  //2. 確定得到回傳資料後，觸發setState
                  setState(() {
                    //3. data就會變成這個 ，之後觸發build，進行widget重繪
                    data = {
                      'time' : result['time'],
                      'location' : result['location'],
                      'isDaytime' : result['isDaytime'],
                    };
                  });
                /*------------------------------*/

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
