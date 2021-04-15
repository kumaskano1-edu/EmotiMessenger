import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/provider/Authentication.dart';
import 'package:messenger/provider/FirebaseApi.dart';
import 'package:messenger/state/User.dart';
import 'package:messenger/widgets/buttons/Buttons.dart';
import 'package:messenger/widgets/interaction/ChatTile.dart';
import 'package:messenger/widgets/interaction/ChatTile.dart';
import 'package:messenger/widgets/interaction/Tabs.dart';
import 'package:scoped_model/scoped_model.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        Future<List<String>> sessionIds = FirebaseApi.getChatingTiles(model.studentID);
        return Scaffold(
        floatingActionButton: Container(
          height: 120.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(child: Icon(Icons.add, size: 40,),),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column( //Main Column
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row( // the Avatar + Search
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.brown.shade800,
                          child: model.imageUrl != null ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        model.imageUrl.toString())
                                )),
                          ): Text(model.name[0].toUpperCase()),
                        ),
                      ),
                      Icon(
                        AntIcons.search_outline,
                        size: 22,
                        color: DarkGrey,
                      ),

                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 25, bottom: 10, left: 20, right: 20),
                    child: HeaderTabs()),
                Container(
                  child: Column(
                    children: [

                    ],
                  ),
                ),
                Container(
                  child: PrimaryButton(text: "Logout", onPressed: () async {
                    if(await signOut()) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                    };
                  },),
                )
              ],
            ),
          ),
        )
      );
      }
    );
  }
}
