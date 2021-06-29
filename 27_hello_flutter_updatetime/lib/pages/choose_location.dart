import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_updatetime_27/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [  //各地
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

  /*------------更動部分------------*/
  //1.創一個不用回傳值的function，當點擊某個國家後，觸發此function，先取得時間，之後返回上一頁

  void updateTime(index) async{  //index 是 locations 這個 List 的 index

    //例子 :
    //當 index 為 0 時，
    //WorldTime example =
    //WorldTime(url: 'Asia/Taipei', location: 'Taiwan', flag: 'taiwan.png'),

    WorldTime example = locations[index]; //example是WorldTime格式(建構子的樣子)

    await example.getTime();  //從API取得時間

    Navigator.pop(context,{  //帶著數據，返回上一頁
      'location' : example.location,
      'flag' : example.flag,
      'time' : example.time,
      'isDaytime' : example.isDaytime,
    });
  }
  /*------------------------------*/

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
                    /*------------更動部分------------*/
                    //print('${locations[index].location}');
                    //2. 引用那個function
                    updateTime(index);  //此function不用回傳
                    /*------------------------------*/
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

