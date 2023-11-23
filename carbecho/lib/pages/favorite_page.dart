import 'package:flutter/material.dart';

class FavioritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavioritePage();
}

class _FavioritePage extends State<FavioritePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Favirote page"),
      ),
      body: Text("This is faviorite page"),
    );
  }
}
