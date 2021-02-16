import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/screens/Dashboard.dart';
import 'package:messenger/screens/auth/Authentication.dart';
import 'package:messenger/screens/auth/DefaultScreenAuth.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/authentication',
      theme: ThemeData(
        primaryColor: Blue,
        scaffoldBackgroundColor: White
      ),
      routes: {
        '/authentication': (context) =>  Authentication(),
        '/dashboard': (context) => Dashboard()
      },
    );
  }
}

