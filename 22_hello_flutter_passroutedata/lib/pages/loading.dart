import 'package:flutter/material.dart';

/*------------更動部分------------*/
import 'package:hello_flutter_passroutedata_22/services/world_time.dart';
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  /*------------更動部分------------*/

  //String time = 'Loading...';  //刪除


  void setupWorldTime() async{
    WorldTime example = WorldTime(location:'Taiwan',flag:'Taiwan.png',url:'Asia/Taipei');
    await example.getTime();

    //    刪除
    //    setState(() {
    //      time = example.time;
    //    });

    //這個是新的頁面疊加在舊的頁面上，但是由於查詢完這頁面就能捨棄，因此用另一種方式
    //Navigator.pushNamed(context, '/home');

    //新的頁面 取代 舊的頁面 (無資料傳遞功能)
    //Navigator.pushReplacementNamed(context, '/home');

    //新的頁面 取代 舊的頁面 (包含資料傳遞功能，格式為 key:value)
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : example.location,
      'flag' : example.flag,
      'time' : example.time,
    });

  }
  /*------------------------------*/






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
