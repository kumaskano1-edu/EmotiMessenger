import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
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
  bool showPassword = false;
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
                              child: Center(child: CustomBackButton()),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: double.infinity,
                            child: Center(child: Text("Profile", style: TextStyle(fontSize: 20),)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4,
                                        color: Grey
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 1))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                        ))),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color: Blue,
                                      ),
                                      color: Blue,
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  )),

                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: spacingUnit),//THE name and email section
                          child: Column(
                            children: [
                              Text("Kurmanbek Karaev", style: TextStyle(fontSize: 25),),
                              Text("kumakaraev01@gmail.com", style: TextStyle(fontWeight: FontWeight.w300),),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                        ),
                        //THOSE OPTION BUTTONS
                        Container(
                          padding: EdgeInsets.only(top: spacingUnit * 2),
                          child: Column(
                            children: [
                              ProfileListItem(icon: AntIcons.profile_outline, text: "Account"),
                              ProfileListItem(icon: AntIcons.question_circle_outline, text: "Help & Support"),
                              ProfileListItem(icon: AntIcons.setting_outline, text: "Settings"),
                              ProfileListItem(icon: AntIcons.logout_outline, text: "Logout")
                            ],
                          ),
                        )
                      ],
                    )
                  )],
              )
            ),
          );
        }
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spacingUnit * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: spacingUnit * 2.5,
      ).copyWith(
        bottom: spacingUnit * 1.5,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: spacingUnit * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacingUnit * 3),
        color: Grey,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: spacingUnit * 2.5,
          ),
          SizedBox(width: spacingUnit * 1.5),
          Text(
            this.text,
            style: TextStyle(fontWeight: FontWeight.w500)
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              AntIcons.right_outline,
              size: spacingUnit * 2.5,
            ),
        ],
      ),
    );
  }
}