import 'package:flutter/material.dart';

void showDialogBox(context, topic, mainDesc) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: topic,
          content: mainDesc,
          actions: [
            MaterialButton(
              onPressed: () {},
              child: Text("Close"),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("ok"),
            )
          ],
        );
      });
}
