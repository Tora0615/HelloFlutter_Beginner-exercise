import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:updatetime_improve_28/services/world_time.dart';
/*------------更動部分------------*/
import 'package:updatetime_improve_28/services/show_alert.dart'; //網路有問題則提醒的package
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime example = WorldTime(location:'Taiwan',flag:'taiwan.png',url:'Asia/Taipei');

    /*------------更動部分------------*/
    bool getTimeSuccess;
    getTimeSuccess = await example.getTime(); //判斷是否有拿到資料
    /*-------------------------------*/

    /*------------更動部分------------*/
    if (getTimeSuccess==true){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location' : example.location,
        'time' : example.time,
        'timeInterval' : example.timeInterval,

        'url': example.url,  //<重要>新加的，用來返回url，刷新時間會用到
      });
    }else{
      await showAlert(context);
      Navigator.pushReplacementNamed(context, '/');
    }
    /*------------------------------*/

  }


  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build() Called');
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Center(
            child : SpinKitCubeGrid(
              color: Colors.blueGrey[100],
              size: 50.0,
            ),
        ),
      ),
    );
  }
}
