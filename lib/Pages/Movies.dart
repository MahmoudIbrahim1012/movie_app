import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              SizedBox(width: 10),
              SizedBox(width: 10),
            ], // First Row Children
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Text(
                "MOVIES PAGE",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                )
              ),
            ], // Row Children
          ),
        ] // Column Children,
        ),
      ),
      bottomNavigationBar: NavigationBar(currentIndex: 1,),
    );
  }
}
