import 'package:carbecho/pages/favorite_page.dart';
import 'package:carbecho/pages/homePage.dart';
import 'package:carbecho/pages/order.dart';
import 'package:carbecho/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomBarPage extends StatefulWidget {
  @override
  State<BottomBarPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomBarPage> {
  int myCurrentIndex = 0;
  List pages = [HomePage(), FavioritePage(), OrderPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              myCurrentIndex = value;
            });
          },
          currentIndex: myCurrentIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Faviorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_rental), label: "Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: pages[myCurrentIndex],
    );
  }
}
