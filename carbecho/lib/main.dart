import 'package:carbecho/cards/allcards.dart';
import 'package:carbecho/searchbar.dart';
import 'package:carbecho/utility/user_validation_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.debug);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserAuthPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          SearchBar1(),
          ExpandedItem(),
          ExpandedItem2(),
        ],
      ),
    ));
  }
}

class ExpandedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.white,
          height: 100,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(5.0),
              child: SizedBox(
                  width: 100,
                  child: InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                    onTap: () {
                      print("it's working");
                    },
                    onDoubleTap: () => print("it's view page"),
                    onLongPress: () => print("it's long press"),
                  )),
            ),
            itemCount: 50,
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}
