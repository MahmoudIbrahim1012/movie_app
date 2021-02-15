import 'package:flutter/material.dart';
import 'package:movie_app/Pages/Movies.dart';
import 'package:movie_app/Pages/TV.dart';
import 'Pages/Discover.dart';
import 'Pages/Loading.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Discover(),
      '/movies': (context) => Movies(),
      '/shows': (context) => Shows(),
      // '/routename': (context) => routepage(),
    }
));