import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/provider/Authentication.dart';
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
    child: Image(height: 70, image: AssetImage("assets/images/LogoMain.png")));



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _auth = false;
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  AuthenticationProvider authGlobal = new AuthenticationProvider();
  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

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
                  flex: 2,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatInputField(
                      label: "Email",
                      placeholder: "Please Input Email",
                      editingController: EmailController,
                    ),
                    FlatInputField(
                      label: "Password",
                      placeholder: "Please Type Password",
                      editingController: PasswordController,
                    ),
                  ],
                )),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dont have an account?"),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/register');
                            },
                            child: Text(" Register", style: TextStyle(color: Blue, fontSize: 15),))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GoogleSignInButton(),
                    PrimaryButton(text: "Login", onPressed: () async {
                      if(await authGlobal.SignInWithCredentials(EmailController.text, PasswordController.text) == true) {
                        Navigator.pushNamed(context, '/dashboard');
                      };
                    },)
                  ],
                ))
              ]),
        )));
  }
}
