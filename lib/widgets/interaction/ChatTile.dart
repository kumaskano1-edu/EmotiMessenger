import 'package:flutter/material.dart';
import 'package:messenger/models/ChatableUsersModel.dart';
import 'package:messenger/models/SessionModel.dart';
import 'package:messenger/provider/FirebaseApi.dart';
//TODO Stopped while trying to do something with the CHatableUserModel
class ChatTile extends StatefulWidget {
  SessionModel chatModel; //TODO <- Here
  ChatableUsersModel chattingPartner;
  ChatTile(SessionModel messageTile) {
    this.chatModel = messageTile;
  }
  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  Future<String> getNameOfPartner(String partnerID) async {
    ChatableUsersModel userFetchedById = await FirebaseApi.getUserById(partnerID);
    return userFetchedById.name;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/chatscreen"),
        child: ListTile(
          leading: CircleAvatar(
            child: Text("K"),
          ),
          title: widget.chatModel.name.isEmpty ? FutureBuilder<String>(
            future: getNameOfPartner(widget.chatModel.users[0]),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if(snapshot.hasData) {
                  return Text(snapshot.data);
                }
                return Text("Unknown User");
              }
          ): Text(widget.chatModel.name),
          // title: FutureBuilder<String>(
          //   future: getNameOfPartner(widget.chatModel.name.isEmpty ? getNameOfPartner(widget.chatModel.users[0]) : widget.chatModel.name)
          // ),
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
