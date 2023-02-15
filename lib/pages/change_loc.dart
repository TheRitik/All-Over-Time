import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:worldtime/pages/loading.dart';



class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', url: 'Europe/London', flag: 'uk.png'),
    WorldTime(location: 'Athens', url: 'Europe/Berlin', flag: 'greece.png'),
    WorldTime(location: 'Kolkata', url: 'Asia/Kolkata', flag: 'India.png'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(location: 'Jakarta', url: 'Asia/jakarta', flag: 'indonesia.png'),
    WorldTime(location: 'Nairobi', url: 'Africa/Nairobi', flag: 'kenya.png'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context ,{
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {



    print('Build init');
    return Scaffold(

      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Change Location'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:  (contexxt, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 8),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  radius: 25,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
