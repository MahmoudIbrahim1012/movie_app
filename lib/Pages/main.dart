import 'package:flutter/material.dart';
import 'package:movie_app/Misc/NavigationBar.dart';
import 'package:movie_app/Misc/SearchTextField.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
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
              SizedBox(width: 10),
              Text(
                "Trending movies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 120),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "SEE ALL",
                    style:TextStyle(
                      color: Colors.amber,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
            ], // Second Row Children
          ),
          SizedBox(height:200),
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                "Trending shows",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 120),
              TextButton(
                onPressed: () {},
                child: Text(
                  "SEE ALL",
                  style:TextStyle(
                    color: Colors.amber,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ], // Second Row Children
          ),
        ] // Column Children,
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
