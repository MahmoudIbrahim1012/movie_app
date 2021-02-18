import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/Widgets/SearchTextField.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();
  List results;

  Widget initialPage() {
    return Text(" ");
  }

  Widget searchPage() {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: this.results.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 20,
            thickness: 2,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            leading: results[index]["poster_path"] != null ? Image.network(
                "https://image.tmdb.org/t/p/w300/${results[index]["poster_path"]}"): Icon(Icons.movie_outlined),
            title: Text(
              results[index]['name'] == null ? results[index]['title'] : results[index]['name'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
                results[index]['overview'],
              style:TextStyle(
                color: Colors.white70,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          );
        });
  }

  Future<void> search(query) async {
    String apiKey = '777b17dd0bc91a4466365e9cc8572890';
    Response response = await get(
        'https://api.themoviedb.org/3/search/multi?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false');
    Map result = jsonDecode(response.body);
    this.results = result['results'];
    setState(() {
      build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    widget = myController.text.isNotEmpty ? searchPage() : initialPage();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchTextField(
              readOnly: false,
              controller: myController,
              onSubmitted: (value) {
                search(value);
              },
            ),
            Expanded(
              child: widget,
            ),
          ], // Column children
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search_sharp,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[600],
        onPressed: () {
          search(myController.text);
        },
      ),
    );
  }
}
