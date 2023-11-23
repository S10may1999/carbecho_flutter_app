import 'package:flutter/material.dart';

class SearchBar1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(244, 243, 243, 0.543),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))),
      child: TextField(
          decoration: InputDecoration(
              hintText: "Enter you're looking for...",
              prefixIcon: InkWell(
                onTap: () => print("it's search"),
                child: Icon(Icons.search),
              ),
              suffixIcon: InkWell(
                onTap: () => print("it's filter"),
                child: Icon(Icons.filter_alt),
              ))),
    );
  }
}
