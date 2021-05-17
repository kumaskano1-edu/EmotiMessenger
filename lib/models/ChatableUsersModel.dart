import 'package:flutter/material.dart';

class ChatableUsersModel {
  String userId;
  String name;
  String profileURL;
  String userStatus;

  ChatableUsersModel({
    this.userId,
    this.name,
    @required this.profileURL,
    @required this.userStatus,
  });
}