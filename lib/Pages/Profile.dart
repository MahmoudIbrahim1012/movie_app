import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 5.0,
        actions: [
          IconButton(
            icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
            onPressed: (){
              //log out icon
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          'profile'.toUpperCase(),
          style: TextStyle(
            color: Colors.amber,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage('https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png'),
            ),
            Text(
              'user name',
              softWrap: true,
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(currentIndex: 3,), //i am not sure about number 3 //////////////////////////
    );
  }
}
