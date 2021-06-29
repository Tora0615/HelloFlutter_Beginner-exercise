import 'package:flutter/material.dart';
/*------------更動部分------------*/
import 'package:updatetime_improve_28/services/world_time.dart';
import 'package:updatetime_improve_28/services/show_alert.dart'; //網路有問題則提醒的package
/*------------------------------*/

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Map data = {};

  /*------------更動部分------------*/
  //新的變數
  String time;  //存時間的變數，分離出來才能被setState改變
  bool refresh;  //存是否已經按下刷新按鈕
  /*------------------------------*/

  @override
  Widget build(BuildContext context) {


    data =  data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; //資料接收


    /*------------更動部分------------*/
    //print(data);

    //背景圖依照四個時段的不同，用四張不同的照片
    String bgImage;
    if (data['timeInterval']==1){
      bgImage = 'sunrise' ;
    }else if(data['timeInterval']==2){
      bgImage = 'day' ;
    }else if(data['timeInterval']==3){
      bgImage = 'sunset' ;
    }else if(data['timeInterval']==4){
      bgImage = 'night' ;
    }

    //文字顏色
    Color wordColor = (data['timeInterval']==1 || data['timeInterval']==2 ) ? Colors.black87 : Colors.white ;


    //後面按下按鈕後，time會是新的值。
    //而setState會觸發widget的re-build，若不加判斷式會被舊的data['time']再次覆蓋過去
    //所以以有沒有標記待刷新，來判別要不要動到時間的資料
    //判斷式說明 :
    //看refresh是否為true?
    //若是，則不動已經更新的資料，並把標記變成false；
    //若不是(像是第一次執行的情形)，則以data['time']來設定time的資料
    refresh==true ? refresh=false : time = data['time'];
    /*------------------------------*/


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


                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  /*------------更動部分------------*/
                  if(result!=null){
                    setState(() {
                      //3. data就會變成這個 ，之後觸發build，進行widget重繪
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'timeInterval' : result['timeInterval'],
                        'url' : result['url'],  //新加，換頁面要傳回
                      };
                    });
                  }
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

              /*------------更動部分------------*/
              time, //time變數
              /*-------------------------*/

              style: TextStyle(
                fontSize: 66,
                letterSpacing: 2,
                color: wordColor,
              ),
            ),
          ],
        ),
      ),

      /*------------更動部分------------*/
      //時間更新按鈕
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () async{

          WorldTime temp =  WorldTime(url:data['url']); //新物件

          //有沒有成功拿到資料
          //成功會返回true，失敗(如無網路)會返回false
          refresh = await temp.getTime();

          if(refresh == true){  //有拿到 : 重設時間
            setState(() {  //觸發刷新
              time = temp.time;
            });
          }else{  //沒有拿到 : 警告
            showAlert(context);
          }
        },
        child: Icon(Icons.refresh),
      ),
      /*-------------------------*/


    );
  }
}
