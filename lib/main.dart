import 'package:flutter/material.dart';
import 'package:movie_app/Pages/GetStarted.dart';
import 'package:movie_app/Pages/MediaDetails.dart';
import 'package:movie_app/Pages/Movies.dart';
import 'package:movie_app/Pages/TV.dart';
import 'Pages/Discover.dart';
import 'Pages/Loading.dart';
import 'Pages/Search.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => Discover(),
      '/movies': (context) => Movies(),
      '/shows': (context) => Shows(),
      '/search': (context) => Search(),
      '/started': (context) => GetStarted(),
      '/details': (context) => MediaDetails(),
      // '/routename': (context) => routepage(),
    }));
//comment