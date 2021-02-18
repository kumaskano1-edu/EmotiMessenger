import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/screens/Dashboard.dart';
import 'package:messenger/screens/auth/LoginScreen.dart';
import 'package:messenger/screens/auth/SignUpScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      theme: ThemeData(
        primaryColor: Blue,
        scaffoldBackgroundColor: White
      ),
      routes: {
        '/login': (context) =>  LoginScreen(),
        '/dashboard': (context) => Dashboard(),
        '/register': (context) => SignUpScreen()
      },
    );
  }
}

