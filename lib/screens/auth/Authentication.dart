import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/screens/auth/IntroScreen.dart';

/*checking the authenticated users
* redirecting between screens */
class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(35.0, 70.0, 0.0, 0.0),
                  child: Text(                                                  
                    "Hello",
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5.0, 50.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                          height: 280,
                          image: AssetImage("assets/images/Logo.png"))
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(35.0, 280.0, 35.0, 0.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Please Input Your Email',
                          ),
                          autofocus: false,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Passwords',
                              hintText: 'Please type your password',
                            ),
                            autofocus: false,
                          ),
                        )
                      ],
                    ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 580.0, 0.0, 0.0),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child:Container(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: RaisedButton(
                            color: Colors.white,
                            elevation: 0.5,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            highlightElevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(image: AssetImage('assets/icons/socialAuth/google.png'), height: 35.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),),
                        ),
                      ),
                    ),
                  )
                  ),
                Container(
                    padding: EdgeInsets.fromLTRB(0.0, 650.0, 0.0, 0.0),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child:Container(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            child: RaisedButton(
                              color: Blue,
                              elevation: 0.5,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              highlightElevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                child: Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ),),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
