import 'package:flutter/material.dart';
import 'package:movie_app/Pages/Movies.dart';
import 'package:movie_app/Pages/TV.dart';
import 'Pages/Home.dart';
import 'Pages/Loading.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/movies': (context) => Movies(),
      '/shows': (context) => Shows(),
      // '/routename': (context) => routepage(),
    }
));