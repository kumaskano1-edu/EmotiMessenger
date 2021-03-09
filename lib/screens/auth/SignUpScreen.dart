import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/provider/Authentication.dart';
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
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final Password2Controller = TextEditingController();
  AuthenticationProvider authGlobal = new AuthenticationProvider();
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
                      flex: 3,
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
                    flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FlatInputField(label: "Email", editingController: EmailController, placeholder: "Please Input Email",),
                            FlatInputField(label: "Password", editingController: PasswordController, placeholder: "Please Type Password",),
                            FlatInputField(label: "Retype Password", editingController: Password2Controller, placeholder: "Please Retype Password",),

                          ],
                        ),),
                    Expanded(
                          flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Already have an account?"),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, '/login');
                                },
                                child: Text(" Login", style: TextStyle(color: Blue, fontSize: 15),))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[GoogleSignInButton(),
                            PrimaryButton(text: "Register", onPressed: () async {
                              if(await authGlobal.SignUpWithCredentials(EmailController.text, PasswordController.text, Password2Controller.text) == true) {
                                Navigator.pushNamed(context, '/dashboard');
                              };
                            },)
                          ],
                        ))
                  ]),
            )));
  }
}
