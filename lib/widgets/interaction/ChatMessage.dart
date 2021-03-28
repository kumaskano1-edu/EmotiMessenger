import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/models/MessageModel.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessageModel message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.video:
          return VideoMessage();
          break;
        default:
          return SizedBox();
      };
    }
    return Padding(
      padding: EdgeInsets.only(top: spacingUnit ),
      child: Row(
        mainAxisAlignment:
        message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            SizedBox(width: spacingUnit / 1.5),
          ],
          messageContaint(message),
        ],
      ),
    );
  }
}



///messages widgets:: TEXT WIDGET
class TextMessage extends StatelessWidget {
  const TextMessage({
    Key key,
    this.message,
  }) : super(key: key);

  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacingUnit * 1.4,
        vertical: spacingUnit * 1.5,
      ),
      decoration: BoxDecoration(
        color: Blue.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        message.text,
        style: TextStyle(
          fontSize: 15,
          color: message.isSender
              ? White
              : Black,
        ),
      ),
    );
  }
}

///messages widgets VIDEO WIDGET
class VideoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45, // 45% of total width
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset("assets/images/Video Place Here.png"),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                size: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}