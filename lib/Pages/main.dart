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
            ], // Row Children
          )
        ] // Column Children,
            ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
