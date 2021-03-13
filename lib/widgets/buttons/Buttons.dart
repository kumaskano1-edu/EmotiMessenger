import 'package:flutter/material.dart';
import 'package:messenger/provider/Authentication.dart';

import '../../constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  PrimaryButton({this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: RaisedButton(
          color: Blue,
          elevation: 2,
          onPressed: onPressed,
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
        ));;
  }
}
class GoogleSignInButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  GoogleSignInButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.white,
        elevation: 1,
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
    );;
  }
}
