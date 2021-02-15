import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/Services/Movie.dart';
import 'package:movie_app/Services/Show.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  setUpDiscover() async {
    Movie instance = Movie();
    Show instance1 = Show();
    List movies = await instance.getPopularMovies();
    List shows = await instance1.getPopularShows();
    Map data ={
      'movies': movies,
      'shows': shows,
    };
    Navigator.pushReplacementNamed(context, '/home', arguments: data);
  }

  @override
  void initState() {
    super.initState();
    setUpDiscover();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: SpinKitWave(
            color: Colors.amber,
            size: 80.0,
          ),
        )
    );
  }
}
