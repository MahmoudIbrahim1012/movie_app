import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {

  int currentIndex;
  BuildContext context;
  NavigationBar({this.currentIndex, this.context});

  void switchPage(index)
  {
    switch(index){
      case 0:
        Navigator.pushReplacementNamed(context, '/shows');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/movies');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/home');
        break;
  }

  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[800],
      selectedItemColor: Colors.amber[600],
      unselectedItemColor: Colors.amber[200],
      currentIndex: currentIndex,
      onTap:(index) {
        switch(index){
          case 0:
            Navigator.pushReplacementNamed(context, '/shows');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/movies');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/home');
            break;
        }

      } ,

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.tv_sharp),
          label: 'TV',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_creation_outlined),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_sharp),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ], // Nav bar items
    );
  }
}