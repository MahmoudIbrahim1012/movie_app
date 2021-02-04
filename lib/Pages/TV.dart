import 'package:flutter/material.dart';
import 'package:movie_app/Misc/NavigationBar.dart';
import 'package:movie_app/Misc/SearchTextField.dart';

class Shows extends StatefulWidget {
  @override
  _ShowsState createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
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
              Flexible(
                child: SearchTextField(),
              ),
              SizedBox(width: 10),
            ], // First Row Children
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Text(
                  "Shows PAGE",
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
      bottomNavigationBar: NavigationBar(currentIndex: 0),
    );
  }
}
