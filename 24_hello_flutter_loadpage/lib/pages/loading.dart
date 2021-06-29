import 'package:flutter/material.dart';

/*------------更動部分------------*/
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_flutter_loadpage_24/services/world_time.dart';
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime example = WorldTime(location:'Taiwan',flag:'Taiwan.png',url:'Asia/Taipei');
    await example.getTime();

    /*------ 可以把這幾行註解起來看效果 ------*/
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : example.location,
      'flag' : example.flag,
      'time' : example.time,
    });
    /*------------------------------*/
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

      /*------------更動部分------------*/
      backgroundColor: Colors.blue[900], //背景深藍，好辨別動畫
      /*------------------------------*/

      body: Padding(
        padding: EdgeInsets.all(40),


        /*------------更動部分------------*/
        child: Center(
            child : SpinKitCubeGrid(
              color: Colors.blueGrey[100],
              size: 50.0,
            ),
        ),
        /*------------------------------*/

      ),
    );
  }
}
