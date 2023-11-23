import 'package:carbecho/pages/loginPage.dart';
import 'package:carbecho/utility/bottom_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if user loged in
            if (snapshot.hasData) {
              return BottomBarPage();
            }

            // if user Not logged in
            else {
              return LoginPage();
            }
          }),
    );
  }
}
