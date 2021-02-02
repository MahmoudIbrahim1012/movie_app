import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          "Movie App",
        ),
        centerTitle: true,
      ),
    );
  }
}
