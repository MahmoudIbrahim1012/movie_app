import 'package:flutter/material.dart';
import 'package:movie_app/Pages/GetStarted.dart';
import 'package:movie_app/Pages/MovieDetails.dart';
import 'package:movie_app/Pages/Movies.dart';
import 'package:movie_app/Pages/ShowDetails.dart';
import 'package:movie_app/Pages/TV.dart';
import 'Pages/Discover.dart';
import 'Pages/Profile.dart';
import 'Pages/Search.dart';

Future<void> main() async {
  runApp(MaterialApp(initialRoute: '/started', routes: {
    '/home': (context) => Discover(),
    '/profile': (context) => Profile(),
    '/movies': (context) => Movies(),
    '/shows': (context) => Shows(),
    '/search': (context) => Search(),
    '/started': (context) => GetStarted(),
    '/moviedetails': (context) => MovieDetails(),
    '/showdetails': (context) => ShowDetails(),
    // '/routename': (context) => routepage(),
  }));
}
