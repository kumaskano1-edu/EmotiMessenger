import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/models/MessageModel.dart';
import 'package:messenger/state/User.dart';
import 'package:messenger/widgets/buttons/Buttons.dart';
import 'package:messenger/widgets/buttons/NavigatingButtons.dart';
import 'package:messenger/widgets/decorations/ProfileAvatar.dart';
import 'package:messenger/widgets/interaction/ChatMessage.dart';
import 'package:scoped_model/scoped_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  BackButton(),
                  CircleAvatar(),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kurmanbek Karaev", style: TextStyle(fontSize: 16),),
                      Text("Active 3m ago", style: TextStyle(fontSize: 12),),
                    ],
                  )
                ],
              ),
            ),
            body: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(bottom: spacingUnit),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: spacingUnit),
                          child: ListView.builder(
                            itemCount: demeChatMessages.length,
                            itemBuilder: (context, index) =>
                                ChatMessage(message: demeChatMessages[index])
                          ),
                        ),
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: spacingUnit,
                        vertical: spacingUnit / 1.5,
                      ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        child: SafeArea(
                          child: Row(
                            children: [
                              SizedBox(width: spacingUnit),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: spacingUnit * 1.5,
                                    vertical: spacingUnit * 0.20
                                  ),
                                  decoration: BoxDecoration(
                                      color: Grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(AntIcons.smile_outline),
                                      SizedBox(width: spacingUnit * 1.25),
                                      Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Your Message",
                                          border: InputBorder.none
                                      ),
                                         )
                                      ),
                                      Icon(AntIcons.plus_circle_outline),
                                    ],

                                  ),
                                )
                              ),
                              SizedBox(width: spacingUnit * 1.5),
                              FloatingActionButton(
                                child: Icon(AntIcons.arrow_right),
                                onPressed: (){
                                  print('You tapped on FloatingActionButton');
                                },
                              ),
                            ]),
                        ),
                      )
                    ],
                  ),
                ),
            ),
          );
        }
    );
  }
}