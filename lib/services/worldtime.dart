import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:worldtime/pages/change_loc.dart';

class WorldTime{
  String location = '';
  String time = '';
  String url = '';
  String flag = '';
  bool isDayTime = false;
  WorldTime({required this.location ,required this.url,required this.flag});
  Future <void> getTime() async{
    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      print(datetime);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      isDayTime = now.hour>6 && now.hour<20 ? true:false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('catch an error $e');
      time = 'time not get ';
    }


  }
}
// WorldTime instance = WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');