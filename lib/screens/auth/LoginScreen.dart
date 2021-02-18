import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/screens/auth/IntroScreen.dart';
import 'package:messenger/widgets/buttons/Buttons.dart';
import 'package:messenger/widgets/interaction/Inputs.dart';

/*checking the authenticated users
* redirecting between screens */
Widget TitleLarge(String text) => Container(
      height: 90,
      child: Text(
        text ?? "Unknown Text",
        style: TextStyle(
            fontSize: 80.0, fontWeight: FontWeight.bold, color: Black),
      ),
    );
Widget ImageLogo(logo) => Container(
  child: Image(
    height: 70,
    image: AssetImage("assets/images/LogoMain.png")
  )
);
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TitleLarge("Sign In"),
                              ImageLogo(null)
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
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[GoogleSignIn(), PrimaryButton(text: "Login")],                ))
              ]),
        )));
  }
}
