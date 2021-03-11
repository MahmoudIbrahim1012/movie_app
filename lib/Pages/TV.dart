import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

class Shows extends StatefulWidget {
  @override
  _ShowsState createState() => _ShowsState();
}

List watchList;
Future<void> getWatchList(
    String sessionID, var accountID, String apiKey) async {
  Response response = await get(
      'https://api.themoviedb.org/3/account/$accountID/watchlist/tv?api_key=$apiKey&language=en-US&session_id=$sessionID&sort_by=created_at.asc&page=1');
  Map data = json.decode(response.body);
  watchList = data['results'];
}

class _ShowsState extends State<Shows> {
  String sessionID;
  String apiKey = "777b17dd0bc91a4466365e9cc8572890";
  var accountID;

  Future <void> removeShow(int showID) async {
    Map<String, dynamic> data = {
      "media_type": "tv",
      "media_id": showID,
      "watchlist": false
    };
    String url = "https://api.themoviedb.org/3/account/${this.accountID}/watchlist?api_key=${this.apiKey}&session_id=${this.sessionID}";
    Response response = await post(url, headers: {"Content-Type": "application/json;charset=utf-8"}, body: jsonEncode(data));
    print("body: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    Map data = (ModalRoute.of(context).settings.arguments);
    this.accountID = data['id'];
    this.sessionID = data['sessionID'].toString();
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
      body: FutureBuilder(
        future: getWatchList(this.sessionID, int.parse(this.accountID), this.apiKey),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: watchList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                          fit: BoxFit.fill,
                          placeholder: 'images/movie_placeholder.png',
                          image:
                          'https://image.tmdb.org/t/p/original/${watchList[index]['poster_path']}'),
                      Positioned(
                        right: -2,
                        top: -9,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red,
                            size: 22,
                          ),
                          onPressed: () async {
                            await removeShow(watchList[index]['id']);
                          },
                        ),
                      ),
                    ],
                  );
                });
          } // End of If condition
          else {
            return Center(
              child: SpinKitWave(
                color: Colors.amber,
                size: 80.0,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: NavigationBar(
        currentIndex: 0,
        data: data,
      ),
    );
  }
}
