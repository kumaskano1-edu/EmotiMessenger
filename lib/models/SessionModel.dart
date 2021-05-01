import 'package:cloud_firestore/cloud_firestore.dart';

class SessionModel {
  SessionModel.alpha({
    this.messages,
    this.name,
    this.users,
    this.lastUpdated,
  });


  List<String> messages;
  String name;
  List<String> users;
  Timestamp lastUpdated;

  void GenerateModelFromSessionMap(){

  }
  Map<String, dynamic> toJson() => {
    "messages": List<dynamic>.from(messages.map((x) => x)),
    "name": name,
    "users": List<dynamic>.from(users.map((x) => x)),
    "last_updated": lastUpdated,
  };
}
