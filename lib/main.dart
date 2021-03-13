import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:messenger/screens/Dashboard.dart';
import 'package:messenger/screens/auth/LoginScreen.dart';
import 'package:messenger/screens/auth/SignUpScreen.dart';
import 'package:messenger/screens/decoration/Loading.dart';
import 'package:messenger/screens/errors/Error404.dart';
import 'package:messenger/state/User.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    userModel: UserModel(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> Initialization = Firebase.initializeApp();
  final UserModel userModel;
  MyApp({Key key, @required this.userModel}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Initialization,
      builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return ScopedModel<UserModel>(
              model: userModel,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: '/login',
                home: Dashboard(),
                theme: ThemeData(
                    primaryColor: Blue,
                    scaffoldBackgroundColor: White
                ),
                routes: {
                  '/error404': (context) => Error404(),
                  '/login': (context) =>  LoginScreen(),
                  '/dashboard': (context) => Dashboard(),
                  '/register': (context) => SignUpScreen()
                },
              ),
            );
          } else if(snapshot.hasError) {
              return Error404();
          }
          return LoadingScreen();
        }
    );
  }
}

