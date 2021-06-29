import 'package:flutter/material.dart';

/*------------更動部分------------*/
import 'package:hello_flutter_wrdtime_class_20/services/world_time.dart';
/*------------------------------*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  /*------------更動部分------------*/
  String time = 'Loading...';

//  void setupWorldTime(){
//    WorldTime example = WorldTime(location:'Taiwan',flag:'Taiwan.png',url:'Asia/Taipei');  //建構子初始化
//    example.getTime();  //呼叫建構子裡的函式
//    print(example.time);
//    //因為class裡有用async/await，print 不會等待 example.getTime() ，所以不會有東西
//  }

  void setupWorldTime() async{
    WorldTime example = WorldTime(location:'Taiwan',flag:'Taiwan.png',url:'Asia/Taipei');  //建構子初始化
    await example.getTime();  //呼叫建構子裡的函式
    //print(example.time);  //這樣就會有結果了
    
    //為了使結果顯示在畫面上，另外加了這個
    setState(() {
      time = example.time;
    });
  }

  @override
  void initState() {
    print('----- 按下了 Edit Location 按鈕 -----');
    print('initState() Called');
    super.initState();
    setupWorldTime();  //初始化的時候去Get Url return
  }

  /*------------------------------*/


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
