import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Services/Movie.dart';

class MediaDetails extends StatefulWidget {


  @override
  _MediaDetailsState createState() => _MediaDetailsState();
}

class _MediaDetailsState extends State<MediaDetails> {
  var movieID;
  Map movieDetails;
  Map video;

  Future <void> getMediaReady() async {
    Movie instance = Movie();
    print(this.movieID);
    this.movieDetails = await instance.getMovieDetails(this.movieID);
    this.video = await instance.getMovieVideos(this.movieID);
  }

  String toHours(var minutes) {
    Duration duration = new Duration(minutes: minutes);
    String time = duration.toString();
    return "${time.substring(0,1)}h ${time.substring(2,4)}m";
  }

  String toDate(String date) {
    DateTime formatted = DateTime.parse(date);
    return DateFormat.yMMMd().format(formatted).toString();
  }

  @override
  void initState() {
    super.initState();
    toHours(150);
  }

  Widget build(BuildContext context) {
    this.movieID = ModalRoute.of(context).settings.arguments;
    return FutureBuilder <void> (
        future: getMediaReady(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done)
            {
              return Scaffold(
                backgroundColor: Colors.grey[900],
                    body: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                           Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                            "https://image.tmdb.org/t/p/original/${this.movieDetails['backdrop_path']}",
                            ),
                          ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  this.movieDetails['title'],
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 45.0,
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
                                  '${toHours(this.movieDetails['runtime'])}. ${this.movieDetails['genres'][0]['name']}, ${this.movieDetails['genres'][1]['name']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
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
                                  SizedBox(width:2),
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
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30.0,
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
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: Image(
                                      height: 70,
                                      width: 70,
                                      image: AssetImage('images/youtube.png',),
                                    ),
                                    onTap: () async{
                                      AndroidIntent intent = AndroidIntent(
                                        action: 'action_view',
                                        data: "https://www.youtube.com/watch?v=${this.video["results"][0]["key"]}",
                                      );
                                      await intent.launch();
                                    },
                                  ),
                                  Text(
                                    'Watch trailer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
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
                bottomNavigationBar: GestureDetector(
                  onTap: (){
                    //add to watch list
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        ' + ADD TO WATCH LIST ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          else
            {
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
