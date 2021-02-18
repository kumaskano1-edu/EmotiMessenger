import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/screens/auth/IntroScreen.dart';
import 'package:messenger/widgets/buttons/Buttons.dart';
import 'package:messenger/widgets/interaction/Inputs.dart';

/*checking the authenticated users
* redirecting between screens */
Widget TitleLarge(String text) => Container(
  height: 90,
  width: 220,
  child: Text(
    text ?? "Unknown Text",
    style: TextStyle(
        fontSize: 80.0, fontWeight: FontWeight.bold, color: Black),
  ),
);
Widget ImageLogo(logo) => Container(
    width: 220,
    child: Image(
        height: 70,
        image: AssetImage("assets/images/LogoMain.png")
    )
);
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                                      ImageLogo(null),
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
                            FlatInputField(label: "Email", placeholder: "Please Input Email",),
                            FlatInputField(label: "Password", placeholder: "Please Type Password",),
                            FlatInputField(label: "Retype Password", placeholder: "Please Retype Password",),

                          ],
                        )),
                    Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[GoogleSignIn(), PrimaryButton(text: "Register")],
                        ))
                  ]),
            )));
  }
}
