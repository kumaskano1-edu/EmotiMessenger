import 'package:flutter/material.dart';

import '../../constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;

  PrimaryButton({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));;
  }
}
class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );;
  }
}
