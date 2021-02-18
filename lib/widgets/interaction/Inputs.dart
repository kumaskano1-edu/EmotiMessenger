import 'package:flutter/material.dart';

class FlatInputField extends StatelessWidget {
  final String label;
  final String placeholder;
  FlatInputField({this.label, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: placeholder,
        ),
      ),
    );;
  }
}
