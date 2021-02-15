import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      bottomNavigationBar: NavigationBar(currentIndex: 3),
    );
  }
}
