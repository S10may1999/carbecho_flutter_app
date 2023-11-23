import 'package:carbecho/cards/allcards.dart';
import 'package:carbecho/main.dart';
import 'package:carbecho/searchbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Icon(Icons.car_crash_outlined),
              Text(
                "CarBecho.com",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SearchBar1(),
            ExpandedItem(),
            ExpandedItem2(),
          ],
        ),
      ),
    );
  }
}
