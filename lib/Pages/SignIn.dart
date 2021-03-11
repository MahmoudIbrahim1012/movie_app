import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String userName;
  String password;
  String apiKey = '777b17dd0bc91a4466365e9cc8572890';
  String readAccess = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzdiMTdkZDBiYzkxYTQ0NjYzNjVlOWNjODU3Mjg5MCIsInN1YiI6IjYwMWE4M"
      "jc5NDcwZWFkMDA0MTczNzUxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SCUEX_mTOMMnjgjlboaknZ_"
      "gWDRsI_vwGBRCmfNL5ow";
  String requestToken;
  String accessToken;
  bool isLogged = false;
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String> getRequestToken() async {
    Map<String, String> data = {
      'Content-Type': "application/json;charset=utf-8",
      'Authorization':
          "Bearer ${this.readAccess}",
    };
    print("Getting request token");
    String url = "https://api.themoviedb.org/4/auth/request_token";
    Response response = await post(url, headers: data);
    Map returned = jsonDecode(response.body);
    this.requestToken = returned["request_token"];
    return returned["request_token"];
  }

  Future<String> validateLogin(String requestToken) async {
    Map<String, String> data = {
      'Content-Type': "application/json;charset=utf-8",
      'Authorization':
      "Bearer ${this.readAccess}",
    };
    Map map = {
      "request_token": requestToken
    };
    String body = jsonEncode(map);
    String url = "https://api.themoviedb.org/4/auth/access_token";
    Response response = await post(url, headers: data, body: body);
    this.accessToken = jsonDecode(response.body)['access_token'];
    return this.accessToken;
  }

  Future<String> createSession() async {
    String url = "https://api.themoviedb.org/3/authentication/session/convert/4?api_key=${this.apiKey}";
    Map<String, String> data = {
      'Content-Type': "application/json;charset=utf-8",
      'Authorization':
      "Bearer ${this.readAccess}",
    };

    Map map = {
      "access_token": this.accessToken
    };
    String body = jsonEncode(map);
    Response response = await post(url, body: body, headers: data);
    return jsonDecode(response.body)['session_id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.9),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12.0),
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () async {
                  String requestToken = await getRequestToken();
                  launchURL("https://www.themoviedb.org/auth/access?request_token=$requestToken");
                },
                child: Text(
                  'Authorize Access',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12.0),
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () async {
                  await validateLogin(requestToken);
                  String sessionID = await createSession();
                  Navigator.pushReplacementNamed(context, '/profile', arguments: {'sessionID': sessionID});
                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
