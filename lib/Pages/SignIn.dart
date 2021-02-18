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
  String sessionID;
  String loginResponse = " ";
  Color statusColor = Colors.white;
  bool isLogged = false;
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  launchURL() async {
    const url = 'https://www.themoviedb.org/reset-password';
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future <String> getRequestToken() async {
    print("Getting request token");
    Response response = await get('https://api.themoviedb.org/3/authentication/token/new?api_key=$apiKey');
    if(jsonDecode(response.body)["success"] == true)
      {
        String requestToken = jsonDecode(response.body)['request_token'];
        return requestToken;
      }
    else
      {
        print("Unsuccessful");
        return null;
      }
  }

  Future <String> validateLogin(String username, String password, var requestToken) async {
    Map data = {
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    String url = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$apiKey";
    Response response = await post(url, body: data);
    Map returned = jsonDecode(response.body);
    this.statusColor = returned["success"] ==  true ? Colors.green : Colors.red;
    print(returned);
    if(returned["success"] == true)
      {
        isLogged = true;
        return returned["request_token"];
      }
    else
      return returned["status_message"];

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

            TextField(
              controller: userController,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              onSubmitted: (String str) {
                userName = str;
              },
            ),
            TextField(
              controller: passwordController,
              style: TextStyle(
                color: Colors.white,
              ),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                border: InputBorder.none,
              ),
              onSubmitted: (String str) {
                password = str;
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                    this.loginResponse,
                    style: TextStyle(
                      color: this.statusColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      launchURL();
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12.0),
                  primary: Color(0xff13233c),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () async {
                  String requestToken = await getRequestToken();
                  String response = await validateLogin(userController.text, passwordController.text, requestToken);
                  if(!isLogged)
                  {
                  setState(() {
                    this.loginResponse = response;
                  });
                  }
                  else
                    {
                      setState(() {
                        this.loginResponse = " ";
                      });
                      print("Going to profile with token ${this.loginResponse}");
                    }

                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
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
