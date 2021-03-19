import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/provider/Authentication.dart';
import 'package:messenger/screens/auth/helpers/validators.dart';
import 'package:messenger/state/User.dart';
import 'package:messenger/widgets/buttons/Buttons.dart';
import 'package:messenger/widgets/decorations/callouts.dart';
import 'package:messenger/widgets/interaction/Inputs.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:messenger/state/User.dart';
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
  String msg = "";

  LoginScreen() {
    this.msg = "";
  }
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
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
                                    Navigator.pushReplacementNamed(
                                        context, '/register');
                                  },
                                  child: Text(
                                    " Register",
                                    style: TextStyle(color: Blue, fontSize: 15),
                                  ))
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
                              GoogleSignInButton(onPressed: () async {
                                var user = await signInWithGoogle();
                                if(user != null) {
                                  model.setUserModel(user);
                                  return Navigator.pushNamed(context, "/dashboard");
                                }
                              },),
                              PrimaryButton(
                                text: "Login",
                                onPressed: () async {
                                  var user = null;
                                  if (_formKey.currentState.validate()) {
                                    //set the model user by the result of the sign in function
                                     try {
                                       user = await SignInWithCredentials(
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
                                         return Navigator.pushNamed(context, "/dashboard");
                                       }
                                     }
                                }},
                              )
                            ],
                          ))
                    ]),
              ),
            )));
      },
    );
  }
}
