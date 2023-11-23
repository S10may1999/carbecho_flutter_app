import 'package:carbecho/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description Page"),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.amber,
        child: ListTile(
          leading: InkWell(
            child: Icon(Icons.favorite),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AuthPage())),
          ),
          title: Text("Price of the car"),
          trailing:
              OutlinedButton(onPressed: () {}, child: Text("Contact Owner")),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12.0))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 300,
                      child: Text("this is left side "),
                    )),
                Expanded(
                    child: Container(
                  height: 300,
                  child: Text("this is right side "),
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 400,
              color: Colors.blue,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      child: Container(
                        child: Text("this is Main Container"),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onHover: (value) => Colors.amber,
                      onTap: () => AuthPage(),
                    ),
                  );
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        )),
      ),
    );
  }
}
