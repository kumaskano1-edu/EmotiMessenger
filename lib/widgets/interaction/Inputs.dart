import 'package:flutter/material.dart';

class FlatInputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final editingController;

  FlatInputField({this.label, this.placeholder, this.editingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: editingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: placeholder,
        ),
      ),
    );;
  }
}
