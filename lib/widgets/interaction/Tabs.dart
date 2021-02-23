import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HeaderTabs extends StatefulWidget {
  @override
  _HeaderTabsState createState() => _HeaderTabsState();
}

class _HeaderTabsState extends State<HeaderTabs> {
  int segmentedControlValue = 0;

  Widget segmentedControl() {
    const double HorizontalFontPadding = 10;
    const double VerticalFontPadding = 8;
    const double FontSize = 14;
    return Container(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlValue,
          padding: EdgeInsets.all(7),
          backgroundColor: Grey,
          children: const <int, Widget>{
            0: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: VerticalFontPadding,
                  horizontal: HorizontalFontPadding),
              child: Text(
                "Chats",
                style: TextStyle(
                  fontSize: FontSize,
                ),
              ),
            ),
            1: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: VerticalFontPadding,
                  horizontal: HorizontalFontPadding),
              child: Text(
                "Calls",
                style: TextStyle(
                  fontSize: FontSize,
                ),
              ),
            ),
            2: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: VerticalFontPadding,
                  horizontal: HorizontalFontPadding),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: FontSize,
                ),
              ),
            ),
          },
          onValueChanged: (value) {
            setState(() {
              segmentedControlValue = value;
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return segmentedControl();
  }
}
