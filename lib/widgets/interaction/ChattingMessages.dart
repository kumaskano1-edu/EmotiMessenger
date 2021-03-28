import 'package:flutter/cupertino.dart';

class ChattingMessages extends StatelessWidget {
  const ChattingMessages({
    Key key,
    @required this.message,
  }): super(key: key);

  final ChattingMessages message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Chat Text")
      ],
    );
  }
}
