import 'dart:convert';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Services/Movie.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  var movieID;
  Map movieDetails;
  Map video;
  String apiKey = "777b17dd0bc91a4466365e9cc8572890";
  var sessionID;
  var accountID;
  String genres;

  Future<void> getMediaReady() async {
    this.genres = "";
    Movie instance = Movie();
    this.movieDetails = await instance.getMovieDetails(this.movieID);
    print(this.movieDetails);
    this.video = await instance.getMovieVideos(this.movieID);
    for(Map genre in this.movieDetails['genres'])
      {
        this.genres += "${genre['name']} • ";
      }
    this.genres = this.genres.substring(0, this.genres.length -2);
  }

  String toHours(var minutes) {
    Duration duration = new Duration(minutes: minutes);
    String time = duration.toString();
    return "${time.substring(0, 1)}h ${time.substring(2, 4)}m";
  }

  String toDate(String date) {
    DateTime formatted = DateTime.parse(date);
    return DateFormat.yMMMd().format(formatted).toString();
  }

  Future <void> addToList(int movieID) async {
    Map<String, dynamic> data = {
      "media_type": "movie",
      "media_id": movieID,
      "watchlist": true
    };
    String url = "https://api.themoviedb.org/3/account/${this.accountID}/watchlist?api_key=${this.apiKey}&session_id=${this.sessionID}";
    Response response = await post(url, headers: {"Content-Type": "application/json;charset=utf-8"}, body: jsonEncode(data));
    print("body: ${response.body}");
  }

  @override
  void initState() {
    super.initState();
    toHours(150);
  }

  Widget build(BuildContext context) {
    Map data = (ModalRoute.of(context).settings.arguments);
    print("DATA: $data");
    this.sessionID = data['sessionID'];
    this.movieID = data['id'];
    this.accountID = data['accountID'];

    return FutureBuilder<void>(
      future: getMediaReady(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.grey[900],
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Hero(
                      tag: 'movie${this.movieDetails['id']}',
                      child: FadeInImage.assetNetwork(
                        placeholder: 'images/placeholderImage.png',
                        fit: BoxFit.cover,
                        image:
                            "https://image.tmdb.org/t/p/original/${this.movieDetails['backdrop_path']}",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.movieDetails['title'],
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${toHours(this.movieDetails['runtime'])}. ${this.genres}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white60,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            size: 20.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 2),
                          Text(
                            toDate(this.movieDetails['release_date']),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white60,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Movie info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            this.movieDetails['overview'],
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white60,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Image(
                              height: 70,
                              width: 70,
                              image: AssetImage(
                                'images/youtube.png',
                              ),
                            ),
                            onTap: () async {
                              AndroidIntent intent = AndroidIntent(
                                action: 'action_view',
                                data:
                                    "https://www.youtube.com/watch?v=${this.video["results"][0]["key"]}",
                              );
                              await intent.launch();
                            },
                          ),
                          Text(
                            'Watch trailer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            bottomNavigationBar: TextButton(
              onPressed: () {
                addToList(int.parse(this.movieID));
              },
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              child: Text(
                ' + ADD TO WATCH LIST ',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.black45,
            body: Center(
              child: SpinKitChasingDots(
                color: Colors.amber,
                size: 80.0,
              ),
            ),
          );
        }
      },
    );
  }
}
