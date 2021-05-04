import 'package:flutter/material.dart';
//TODO Generate the ChatTile from the SessionModel that has all attributes like last_messages and etc
class ChatTile extends StatefulWidget {
  String ContactName;
  String ContactAvatar;
  String LastMessage;
  String TimeRecieved;
  ChatTile({this.ContactAvatar, this.ContactName, this.LastMessage, this.TimeRecieved});
  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/chatscreen"),
        child: ListTile(
          leading: CircleAvatar(
            child: Text("K"),
          ),
          title: Text(
            "Kurmanbek Karaev"
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Hello there"
              ), Text(""
                  "5:00 PM")
            ],
          ),
        ),
      ),
    );
  }
}
