import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/NavigationBar.dart';
import 'SignIn.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://i.pinimg.com/564x/8d/2d/1c/8d2d1c5e0ee9e5141f1fc51567dba572.jpg",
                  height: 55,
                  width: 55,
                ),
                SizedBox(width: 10),
                Text("MOVIES TIME",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ], // Row Children
            ),
            //SizedBox(height: 250,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 50.0,
                ),
                Text('track your shows and movies',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  onPressed: (){},
                  color: Color(0xff13233c),
                  child: Text(
                    'Get started',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          //Navigator.pushReplacementNamed(context, '/sign');
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (context) => SignIn(),
                          );
                        });
                      },
                      child: Text(
                        "sign in",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ], // Column Children
        ),
      ),
      bottomNavigationBar: NavigationBar(currentIndex: 3),
    );
  }
}
