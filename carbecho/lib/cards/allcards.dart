import 'package:carbecho/pages/description.dart';
import 'package:flutter/material.dart';

class ExpandedItem2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExpandedItem();
}

class _ExpandedItem extends State<ExpandedItem2> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                color: Colors.yellow.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.3),
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ]),
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(11.0),
                child: ListTile(
                  leading: InkWell(
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionPage())),
                  ),
                  title: Text("Name of modal"),
                  subtitle: Text("Price of the car"),
                  trailing: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionPage()));
                      },
                      child: Text("detail")),
                ),
              ),
              itemCount: 10,
              scrollDirection: Axis.vertical,
            )));
  }
}

class ExpandedItem3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          height: 200,
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.black),
              ),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ));
  }
}
