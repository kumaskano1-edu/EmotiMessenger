import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:messenger/provider/Authentication.dart';
import 'package:messenger/widgets/interaction/Tabs.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
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
              HeaderTabs()
            ],
          ),
        ),
      )
    );
  }
}
