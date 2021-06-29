import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_listviewbuild_26/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  /*------------更動部分------------*/
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

      /*------------更動部分------------*/
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
                    print('${locations[index].location}');
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
      /*------------------------------*/

    );
  }
}

