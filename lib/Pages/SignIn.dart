import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String user_name = '';
  String password = '';

  launchURL() async {
    const url = 'https://www.themoviedb.org/reset-password';
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
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
                user_name = str;
              },
            ),
            TextField(
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
            TextButton(
              onPressed: () {
                setState(() {
                  //Navigator.pushReplacementNamed(context, '/');
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                onPressed: () {},
                color: Color(0xff13233c),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
