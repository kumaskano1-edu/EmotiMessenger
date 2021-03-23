import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:messenger/state/User.dart';
import 'package:messenger/widgets/buttons/Buttons.dart';
import 'package:messenger/widgets/buttons/NavigatingButtons.dart';
import 'package:messenger/widgets/decorations/ProfileAvatar.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            color: Colors.yellow,
                              child: Center(child: CustomBackButton()),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: double.infinity,
                            color: Colors.red,
                            child: Center(child: Text("Profile")),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            color: Colors.blueAccent,
                            child: Center(child: Text("Edit")),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                      child:Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        child: Stack(
                          children: <Widget>[
                              Container(
                                width: double.infinity,
                                  child: CircleAvatar()
                              ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    AntIcons.edit_outline,
                                  ),
                                ),
                            )
                            )],
                        ),
                      )
                      ),
                  Expanded(flex: 6, child: Text("Juna"))
                ],
              )
            ),
          );
        }
    );
}
}
