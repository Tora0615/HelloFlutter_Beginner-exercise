import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
/*------------更動部分------------*/
import 'package:hello_flutter_listviewbuild_26/services/world_time.dart';
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime example = WorldTime(location:'Taiwan',flag:'taiwan.png',url:'Asia/Taipei');
    await example.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : example.location,
      'flag' : example.flag,
      'time' : example.time,
      /*------------更動部分------------*/
      'isDaytime' : example.isDaytime,
      /*------------------------------*/
    });
  }


  @override
  void initState() {
    print('initState() Called');
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    print('build() Called');
    return Scaffold(
      backgroundColor: Colors.blue[900], //背景深藍，好辨別動畫
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
