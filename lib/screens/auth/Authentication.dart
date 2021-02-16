import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/screens/auth/IntroScreen.dart';

/*checking the authenticated users
* redirecting between screens */
Widget TitleLarge(String text) => Container(
      width: 220,
      child: Text(
        text ?? "Unknown Text",
        style: TextStyle(
            fontSize: 80.0, fontWeight: FontWeight.bold, color: Black),
      ),
    );

Widget InputForms(String placholder, String label) => Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: placholder,
        ),
      ),
    );

Widget GoogleSignButton() => Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        color: Colors.white,
        elevation: 1,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        highlightElevation: 0,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Image(
                  image: AssetImage('assets/icons/socialAuth/google.png'),
                  height: 35.0),
              SizedBox(
                width: 30,
              ),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget Button(String text) => Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    width: double.infinity,
    child: RaisedButton(
      color: Blue,
      elevation: 2,
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      highlightElevation: 0,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    ));

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: <Widget>[
                              TitleLarge("Hello"),
                              TitleLarge("Emoti"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InputForms("Please Input Your Name", "Email"),
                    InputForms("Please Input Your Password", "Password")
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[GoogleSignButton(), Button("Login")],
                ))
              ]),
        )));
  }
}
