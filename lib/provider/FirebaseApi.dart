import 'package:ant_icons/ant_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger/models/SessionModel.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirebaseApi {

  static Future<bool> checkIfUserExists(String UserId) async {
    bool Userexists = false;
    CollectionReference users = firestore.collection('users');
    try {
      await users.doc(UserId).get().then((doc) {
        if (doc.exists)
          Userexists = true;
        else
          Userexists = false;
      });
      return Userexists;
    } catch (e) {
      return false;
    }
  }
//Use hashing to fetch session id by combining two1 users that are chatting
  static saveUsertoDB(User user) async {
    CollectionReference users = firestore.collection('users');

    return users.doc(user.uid).set({
      'name': user.displayName,
      'profile_url': user.photoURL.toString(),
      'status': "Hey there I am using Emoti!",
    })
        .then((response) => print("User Created!"))
        .catchError((onError) => print(onError.toString()));
  }
  static List<String> getChatingTiles(String currentUserId) {
    CollectionReference sessions = firestore.collection('sessions');
    CollectionReference users = firestore.collection("users");
    List<String> sessionIdList = <String>[];
    users.doc(currentUserId).get().then((value) => {
       for(String elem in value.data()['sessions']) {
         sessionIdList.add(elem)
       }
    });
    print("list is here :");
    print(sessionIdList);
    return sessionIdList;
  }


}