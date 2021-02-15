import 'package:http/http.dart';
import 'dart:convert';

class Movie {
  String _apiKey = '777b17dd0bc91a4466365e9cc8572890';
  String movieID;

  Movie({this.movieID});

  Future <List> getPopularMovies() async {
    Response response = await get('https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=1');
    Map data = json.decode(response.body);
    return data['results'];
  }
}