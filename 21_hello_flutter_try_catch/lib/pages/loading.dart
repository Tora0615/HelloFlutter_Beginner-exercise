import 'package:flutter/material.dart';

/*------------更動部分------------*/
import 'package:hello_flutter_try_catch_21/services/world_time.dart';
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  String time = 'Loading...';

  void setupWorldTime() async{
    WorldTime example = WorldTime(location:'Taiwan',flag:'Taiwan.png',url:'Asia/Taipei');
    await example.getTime();
    setState(() {
      time = example.time;
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
      //body: Text('loading page'), //原本的
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Text(time),
      ),
    );
  }
}
