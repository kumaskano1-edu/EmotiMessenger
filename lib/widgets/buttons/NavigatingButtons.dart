import 'package:flutter/material.dart';

class CustomBackButton extends StatefulWidget {
  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(),
        Text("Back")
      ],
    );
  }
}
