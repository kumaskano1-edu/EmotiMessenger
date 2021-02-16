import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  Widget child;
  DefaultScreen({Key key, @required this.child}) : super(key: key);
  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child
    );
  }
}
