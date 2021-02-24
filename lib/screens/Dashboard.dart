import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:messenger/provider/Authentication.dart';
import 'package:messenger/widgets/interaction/ChatTile.dart';
import 'package:messenger/widgets/interaction/ChatTile.dart';
import 'package:messenger/widgets/interaction/Tabs.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authProvider = new AuthenticationProvider();
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
                    CircleAvatar(
                      backgroundColor: Colors.brown.shade800,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    authProvider.imageUrl.toString())
                            )),
                      ),
                    ),
                    Icon(
                      AntIcons.search_outline,
                      size: 25,
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
                      ChatTile(ContactAvatar: "K", ContactName: "Kurmanbek",
                        LastMessage: "Hey how are you doing", TimeRecieved: "1:00AM",),
                    ChatTile(ContactAvatar: "MD", ContactName: "Kurmanbek",
                      LastMessage: "wHATSUPP!!!", TimeRecieved: "1:00AM",),
                    ChatTile(ContactAvatar: "KU", ContactName: "Kurmanbek",
                      LastMessage: ":)", TimeRecieved: "1:00AM",),
                    ChatTile(ContactAvatar: "SY", ContactName: "Kurmanbek",
                      LastMessage: "Love you", TimeRecieved: "1:00AM",),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
