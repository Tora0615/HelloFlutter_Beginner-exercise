import 'package:flutter/material.dart';

/*------------更動部分------------*/
import 'package:hello_flutter_format_show_23/services/world_time.dart';
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime example = WorldTime(location:'Taiwan',flag:'Taiwan.png',url:'Asia/Taipei');
    await example.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : example.location,
      'flag' : example.flag,
      'time' : example.time,
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
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Text('Loading'),  //修改成文字
      ),
    );
  }
}
