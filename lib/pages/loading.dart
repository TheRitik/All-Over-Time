import 'dart:convert';
import 'package:worldtime/pages/change_loc.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';
  void setUptime() async {
    WorldTime instance = WorldTime(location:'India',flag:'india.png',url:'Asia/Kolkata' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime':instance.isDayTime,
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUptime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
