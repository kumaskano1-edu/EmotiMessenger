import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 1
              ),
              child: Image(
                  width: 250,
                  height: 200,
                  image: AssetImage('assets/images/Logo.png')),
            ),
            Container(
                child: Center(
                    child: Image(
                        width: double.infinity,
                        image: AssetImage('assets/decorations/humans3.png')))),
            Container(
              margin: EdgeInsets.only(bottom: 32, left: 25, right: 25),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:
                  Center(child: Text('Geting Started', style: TextStyle(color: White, fontSize: 18, fontWeight: FontWeight.normal))),
            )
          ],
        ),
      ),
    );
  }
}
