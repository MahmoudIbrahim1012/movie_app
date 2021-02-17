import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/Services/Movie.dart';

class MediaDetails extends StatefulWidget {


  @override
  _MediaDetailsState createState() => _MediaDetailsState();
}

class _MediaDetailsState extends State<MediaDetails> {
  var movieID;
  Map movieDetails;

  Future <void> getMediaReady() async {
    Movie instance = Movie();
    print(this.movieID);
    this.movieDetails = await instance.getMovieDetails(this.movieID);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    this.movieID = ModalRoute.of(context).settings.arguments;
    return FutureBuilder <void> (
        future: getMediaReady(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done)
            {
              return Scaffold(
                backgroundColor: Colors.black45,
                body: Center(
                  child: Text(
                    movieDetails['overview'],
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
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
