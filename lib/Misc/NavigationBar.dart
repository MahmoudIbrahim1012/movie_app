import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[800],
      selectedItemColor: Colors.amber[600],
      unselectedItemColor: Colors.amber[200],
      currentIndex: 2,
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