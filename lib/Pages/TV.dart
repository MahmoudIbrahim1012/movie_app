import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

class Shows extends StatefulWidget {
  @override
  _ShowsState createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 3.0,
        centerTitle: true,
        title: Text(
          'watch list'.toUpperCase(),
          style: TextStyle(
            color: Colors.amber,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network('https://image.tmdb.org/t/p/original//drulhSX7P5TQlEMQZ3JoXKSDEfz.jpg'),
                title: Text(
                  'my move name',
                  softWrap: true,
                  style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  'sdfghjkl;uytdfghjkl;sdfghjkl;ertyuiopxcvbnmrtyuiocvhudvisdhnviejgowisgbvujsdgpoweugfodshgr',
                  softWrap: true,
                  style:TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }),
      ),
      bottomNavigationBar: NavigationBar(currentIndex: 0),
    );
  }
}
