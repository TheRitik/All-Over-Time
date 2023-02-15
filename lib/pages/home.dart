import 'package:flutter/material.dart';
import 'package:worldtime/main.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);


    String bgimage = data['isDayTime'] ? 'day.png':'night.jpg' ;
    Color? bgcolor = data['isDayTime']? Colors.blue : Colors.indigo[900] ;
    print(bgimage);

    return Scaffold(

      appBar: AppBar(
        title: Text('World Time',),
        centerTitle: true,
        backgroundColor: bgcolor,
      ),

      // backgroundColor: Colors.grey[400],
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimage'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0 , 100 , 0 , 0),
                  child: TextButton.icon(
                    onPressed: () async {
                       dynamic result =  await Navigator.pushNamed(context, '/loc');
                       setState(() {
                         data = {
                           'time': result['time'],
                           'location':result['location'],
                           'isDayTime': result['isDayTime'],
                           'flag': result['flag'],
                         };
                       });

                       },
                    icon: Icon(Icons.edit_location,
                    color: Colors.grey[100],
                    size: 15,),
                    label: Text('Edit location',
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 15,
                    ),),

                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40.0,
                        letterSpacing: 2,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,0)  ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 70.0,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
