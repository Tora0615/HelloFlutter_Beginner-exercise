import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
/*------------更動部分------------*/
import 'package:hello_flutter_updatetime_27/services/world_time.dart';
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    //預設地區
    WorldTime example = WorldTime(location:'Taiwan',flag:'taiwan.png',url:'Asia/Taipei');
    await example.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : example.location,
      'flag' : example.flag,
      'time' : example.time,
      'isDaytime' : example.isDaytime,
    });
  }


  @override
  void initState() {
    //print('initState() Called');
    setupWorldTime();  //在前面應該能優化
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
