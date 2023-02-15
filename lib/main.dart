
 import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/change_loc.dart';
void main() =>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home':(context) => home(),
    '/loc' :(context) => location(),
  },
));

