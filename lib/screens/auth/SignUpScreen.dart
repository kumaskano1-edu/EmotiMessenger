import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/provider/Authentication.dart';
import 'package:messenger/screens/auth/IntroScreen.dart';
import 'package:messenger/state/User.dart';
import 'package:messenger/widgets/buttons/Buttons.dart';
import 'package:messenger/widgets/decorations/callouts.dart';
import 'package:messenger/widgets/interaction/Inputs.dart';
import 'package:scoped_model/scoped_model.dart';

import 'helpers/validators.dart';
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
  String msg = "";

  SignUpScreen() {
    this.msg = "";
  }
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Form(
                    key: _formKey,
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
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: TextFormField(
                                    controller: NameController,
                                    validator: (value) => formCantBeEmpty(value),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Name',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: TextFormField(
                                    controller: EmailController,
                                    validator: (value) => formCantBeEmpty(value),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: TextFormField(
                                    controller: PasswordController,
                                    obscureText: true,
                                    validator: (value) => formCantBeEmpty(value),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                  ),
                                ),
                                if(!widget.msg.isEmpty) Padding(
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    child: Callout(message: widget.msg, mainColor: LightPink, textColor: DarkRed,)
                                )
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
                                children: <Widget>[
                                  GoogleSignInButton(onPressed: () async {
                                    var user = await signInWithGoogle();
                                    if(user != null) {
                                      model.setUserModel(user);
                                      return Navigator.pushNamed(context, "/dashboard");
                                    }
                                  },),                                  PrimaryButton(text: "Register",  onPressed: () async {
                                    //set the model user by the result of the sign in function
                                    var user = null;
                                    if (_formKey.currentState.validate()) {
                                      //set the model user by the result of the sign in function
                                      try {
                                        user = await SignUpWithCredentials(
                                            NameController.text,
                                            EmailController.text,
                                            PasswordController.text);
                                      } on Exception catch(e) {
                                        String Errormsg = e.toString().substring(e.toString().indexOf(" ") + 1); //removing exception word from the error msg
                                        setState(() {
                                          widget.msg = Errormsg;
                                        });
                                      } finally {
                                        if(user != null) {
                                          model.setUserModel(user);
                                          model.setName(NameController.text);
                                          return Navigator.pushNamed(context, "/dashboard");
                                        }
                                      }
                                    }
                                  },)
                                ],
                              ))
                        ]),
                  ),
                )));
      }
    );
  }
}
