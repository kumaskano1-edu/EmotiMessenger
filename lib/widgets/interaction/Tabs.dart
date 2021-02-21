import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HeaderTabs extends StatefulWidget {
  @override
  _HeaderTabsState createState() => _HeaderTabsState();
}

class _HeaderTabsState extends State<HeaderTabs> {
  int segmentedControlValue = 0;
  Widget segmentedControl() {
    return Container(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlValue,
          backgroundColor: Colors.blue.shade200,
          children: const <int, Widget>{
            0: Text('Chats'),
            1: Text('Calls'),
            2: Text('Profile')
          },
          onValueChanged: (value) {
            setState(() {
              segmentedControlValue = value;
            });
          }
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return segmentedControl();
  }
}
