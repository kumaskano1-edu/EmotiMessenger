import 'package:cloud_firestore/cloud_firestore.dart';

class SessionModel {
  SessionModel.alpha({
    this.messages,
    this.name,
    this.users,
    this.lastUpdated,
  });
  SessionModel.beta() {
    this.messages = [];
    this.users = [];
    this.name = " ";
    this.lastUpdated = null;
  }
  SessionModel.withMap(Map<String, dynamic> sessionMap) {
    this.name = sessionMap['name'].toString();
    this.users = ChangeDynamicListToString(sessionMap['users']);
    this.lastUpdated = sessionMap['last_updated'];
    this.messages = ChangeDynamicListToString(sessionMap['messages']);
    //TODO
  }

  List<String> messages;
  String name;
  List<String> users;
  Timestamp lastUpdated;

  // ignore: non_constant_identifier_names
  Map<String, dynamic> toJson() => {
    "messages": List<dynamic>.from(messages.map((x) => x)),
    "name": name,
    "users": List<dynamic>.from(users.map((x) => x)),
    "last_updated": lastUpdated,
  };
  static List<String> ChangeDynamicListToString(List<dynamic> dynamicList) {
    List<String> stringList = new List<String>();
    for(dynamic dynElem in dynamicList) {
      stringList.add(dynElem.toString());
    }
    return stringList;
  }
}
