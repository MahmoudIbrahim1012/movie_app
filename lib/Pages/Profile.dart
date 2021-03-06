import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';

String sessionID;
Map profileDetails;
Map data;

class Profile extends StatelessWidget {
  final String apiKey = "777b17dd0bc91a4466365e9cc8572890";

  Future getProfileReady() async {
    Response response = await get(
        "https://api.themoviedb.org/3/account?api_key=${this.apiKey}&session_id=$sessionID");
    print(response.body);
    if (jsonDecode(response.body)['success'] == false) {
    } else {
      profileDetails = jsonDecode(response.body);
      data = {'id': profileDetails['id'].toString(), 'sessionID': sessionID};
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null) {
      Map data = ModalRoute.of(context).settings.arguments;
      sessionID = data['sessionID'];
    }
    return FutureBuilder(
      future: getProfileReady(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              elevation: 5.0,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //log out icon
                  },
                ),
              ],
              centerTitle: true,
              title: Text(
                'profile'.toUpperCase(),
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            backgroundColor: Colors.grey[900],
            body: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                      profileDetails["avatar"]["tmdb"]["avatar_path"] != null
                          ? "https://image.tmdb.org/t/p/w300/${profileDetails["avatar"]["tmdb"]["avatar_path"]}"
                          : "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png",
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: profileDetails['name'] == ""
                              ? profileDetails['username']
                              : profileDetails['name'],
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(width: 2),
                        ),
                        WidgetSpan(
                          child: Image.network(
                              "https://www.countryflags.io/${profileDetails['iso_3166_1']}/flat/32.png"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.teal.shade100,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: NavigationBar(
              currentIndex: 3,
              data: data,
            ),
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
