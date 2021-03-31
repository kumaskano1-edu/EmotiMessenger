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
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Profile")
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 11,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: spacingUnit * 3,
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 5,
                                          color: Grey
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            color: Colors.black.withOpacity(0.1),
                                            offset: Offset(0, 1))
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                           'google.com',
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
                            child: Column(
                              children: [
                                Container(padding: EdgeInsets.symmetric(vertical: spacingUnit / 2),
                                    child: Text("Kuma Karaev", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500))),
                                Text("kumakaraev01@gmail.com", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 80),
                          ),
                          //THOSE OPTION BUTTONS
                          Container(
                            padding: EdgeInsets.only(top: spacingUnit * 3),
                            child: Center(
                              child: TabBar(
                                  isScrollable: true,
                                  labelColor: Blue,
                                  unselectedLabelColor: Colors.black.withOpacity(0.3),
                                  indicatorColor: Blue,
                                  tabs: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: spacingUnit * 3),
                                      child: Tab(
                                        child: Text('About', style: TextStyle(fontSize: 20)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: spacingUnit * 3),
                                      child: Tab(
                                        child: Text('Account', style: TextStyle(fontSize: 20)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: spacingUnit * 3),
                                      child: Tab(
                                        child: Text('Setting', style: TextStyle(fontSize: 20)),
                                      ),
                                    ),
                                  ],),
                            ),
                          )
                        ],
                      )
                    )],
                )
              ),
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