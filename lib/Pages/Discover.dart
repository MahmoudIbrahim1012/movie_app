import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null) {
      data = ModalRoute.of(context).settings.arguments;
      popularMovies = data['movies'];
      popularShows = data['shows'];
    }
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                SizedBox(width: 10),
                Flexible(
                  child: GestureDetector(
                    onTap: () {Navigator.pushNamed(context, '/search');},
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
                          Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                            )
                          )
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
                    return Card(
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w300/${popularMovies[index]['poster_path']}'));
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
                    return Card(
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w300/${popularShows[index]['poster_path']}'));
                  }),
            ),
          ] // Column Children,
              ),
        ),
      ),
      bottomNavigationBar: NavigationBar(currentIndex: 2),
    );
  }
}
