import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/Services/Movie.dart';
import 'package:movie_app/Services/Show.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

Map data;
List popularMovies;
List popularShows;

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    super.initState();
  }

  setUpDiscover() async {
    Movie instance = Movie();
    Show instance1 = Show();
    popularMovies = await instance.getPopularMovies();
    popularShows = await instance1.getPopularShows();
  }
  String sessionID;
  String accountID;
  @override
  Widget build(BuildContext context) {
    Map data = (ModalRoute.of(context).settings.arguments);
    this.sessionID = data['sessionID'];
    this.accountID = data['id'].toString();
    return FutureBuilder(
      future: setUpDiscover(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.grey[900],
            body: Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                Map <String, dynamic> data  = {
                                  "sessionID": this.sessionID,
                                  "accountID": this.accountID};
                                Navigator.pushNamed(context, '/search', arguments: data);
                              },
                              child: Container(
                                height: 50,
                                color: Colors.grey[700],
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.search_sharp,
                                      color: Colors.grey[400],
                                    ),
                                    SizedBox(width: 5),
                                    Text("Search",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey[400],
                                        ))
                                  ], // Row children
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ], // First Row Children
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Trending movies",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "SEE ALL",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ], // Second Row Children
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  Map <String, dynamic> data  = {"id": popularMovies[index]['id'].toString(),
                                    "sessionID": this.sessionID,
                                    "accountID": this.accountID};
                                  Navigator.pushNamed(context, '/moviedetails',
                                      arguments: data);
                                },
                                child: Hero(
                                  tag: 'movie${popularMovies[index]['id']}',
                                  child: FadeInImage.assetNetwork(
                                      placeholder:
                                      'images/movie_placeholder.png',
                                      image:
                                      'https://image.tmdb.org/t/p/w300/${popularMovies[index]['poster_path']}'),
                                ),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Trending shows",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "SEE ALL",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ], // Second Row Children
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  Map <String, dynamic> data  = {"id": popularShows[index]['id'].toString(),
                                    "sessionID": this.sessionID,
                                  "accountID": this.accountID};
                                  Navigator.pushNamed(context, '/showdetails',
                                      arguments: data);
                                },
                                child: Card(
                                  child: FadeInImage.assetNetwork(
                                      placeholder:
                                      'images/movie_placeholder.png',
                                      image:
                                      'https://image.tmdb.org/t/p/w300/${popularShows[index]['poster_path']}'),
                                ),
                              );
                            }),
                      ),
                    ] // Column Children,
                ),
              ),
            ),
            bottomNavigationBar: NavigationBar(currentIndex: 2, data: ModalRoute
                .of(context)
                .settings
                .arguments),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: SpinKitWave(
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
