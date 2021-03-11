import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {

  final int currentIndex;
  final BuildContext context;
  var data;
  NavigationBar({this.currentIndex, this.context, this.data});


  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 60,
      color: Colors.blueGrey[800],
      backgroundColor: Color.fromRGBO(0, 51, 77, 0.5),
      index: currentIndex,
      onTap:(index) {
        switch(index){
          case 0:
            Navigator.pushNamed(context, '/shows', arguments: this.data);
            break;
          case 1:
            Navigator.pushNamed(context, '/movies', arguments: this.data);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/home', arguments: this.data);
            break;
          case 3:
            Navigator.pushNamed(context, '/profile', arguments: this.data);
            break;
        }

      } ,

      items: [
        Icon(Icons.tv_sharp, size:30),
        Icon(Icons.movie_creation_outlined, size:30),
        Icon(Icons.search_sharp, size:30),
        Icon(Icons.person, size:30),
      ], // Nav bar items
    );
  }
}