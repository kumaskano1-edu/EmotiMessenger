import 'package:flutter/material.dart';

class Callout extends StatefulWidget {
  String message;
  Color mainColor;
  Color textColor;
  Callout({@required this.message, @required this.mainColor, this.textColor});

  @override
  _CalloutState createState() => _CalloutState();
}

class _CalloutState extends State<Callout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Material(
          elevation: 0.8,
          color: widget.mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Padding(
              padding: EdgeInsets.all(12), child: Text(widget.message, style: TextStyle(color: widget.textColor) ),)));
  }
}
