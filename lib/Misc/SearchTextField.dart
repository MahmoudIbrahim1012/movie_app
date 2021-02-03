import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.grey[400],
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search_sharp,
          color: Colors.grey[400],
        ),
        fillColor: Colors.grey[700],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: new BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        hintText: "Search",
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
