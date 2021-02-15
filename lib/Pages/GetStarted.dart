import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://i.pinimg.com/564x/8d/2d/1c/8d2d1c5e0ee9e5141f1fc51567dba572.jpg",
                height: 50,
                width: 50,
                ),
                SizedBox(width: 10),
                Text("MOVIES TIME",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                ),
              ], // Row Children
            ),
            SizedBox(height: 250,),
          ], // Column Children
        ),
      ),
      bottomNavigationBar: NavigationBar(currentIndex: 3),
    );
  }
}
