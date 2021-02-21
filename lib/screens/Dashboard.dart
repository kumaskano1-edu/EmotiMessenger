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
          padding: EdgeInsets.all(15),
          child: Column( //Main Column
            children: [
              Row( // the Avatar + Search
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    child: Text('AH'),
                  ),
                  Icon(
                    AntIcons.search_outline,
                    size: 50,
                  ),
                ],
              ),
              HeaderTabs(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
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
