import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updatetime_improve_28/services/world_time.dart';

/*------------更動部分------------*/
import 'package:updatetime_improve_28/services/show_alert.dart'; //網路有問題則提醒的package
/*------------------------------*/

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Taipei', location: 'Taiwan', flag: 'taiwan.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];



  void updateTime(index) async{

    WorldTime example = locations[index];


    /*------------更動部分------------*/
    bool getTimeSuccess;
    getTimeSuccess = await example.getTime();

    //偵測時間有沒有取得成功
    if(getTimeSuccess==true){
      Navigator.pop(context,{  //帶著數據，返回上一頁
        'location' : example.location,
        'time' : example.time,
        'timeInterval' : example.timeInterval,

        'url': example.url,  //<重要>新加的，用來返回url，刷新時間會用到
      });
    }else{
      await showAlert(context); //無網路警告
      Navigator.pop(context); //不帶參數，回上一頁
    }
    /*------------------------------*/

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,  //appbar陰影
      ),


      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(   //長方形外框(card)與長方形外框(card)的間距
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            child: Card(  //長方形外框
              child: Padding(  //ListTile與長方形外框(card)的間距
                padding: EdgeInsets.symmetric(vertical: 4),
                child: ListTile(  //等於(國旗+地名)這個集合體
                  onTap: (){
                    updateTime(index);  //此function不用回傳
                  },
                  title: Text('${locations[index].location}'),  //地名
                  leading: CircleAvatar(  //國旗外框
                    backgroundColor: Colors.grey,
                    radius: 25,
                    child: CircleAvatar(  //國旗
                      radius: 24,
                      backgroundImage: AssetImage('images/${locations[index].flag}'),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

