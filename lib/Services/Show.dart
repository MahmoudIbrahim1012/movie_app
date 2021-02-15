import 'package:http/http.dart';
import 'dart:convert';

class Show {
  String _apiKey = '777b17dd0bc91a4466365e9cc8572890';
  String TVID;

  Show({this.TVID});

  Future <List> getPopularShows() async {
    Response response = await get('https://api.themoviedb.org/3/tv/popular?api_key=$_apiKey&language=en-US&page=1');
    Map data = json.decode(response.body);
    return data['results'];
  }
}