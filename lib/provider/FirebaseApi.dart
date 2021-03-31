import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirebaseApi {
//Use hashing to fetch session id by combining two1 users that are chatting
  static saveUsertoDB(User user) async {
    CollectionReference users = firestore.collection('users');

    return users.add({
      'user_id': user.uid,
      'name': user.displayName,
      'profile_url': user.photoURL.toString(),
      'status': "Hey there I am using Emoti!",
    })
        .then((response) => print("User Created!"))
        .catchError((onError) => print(onError.toString()));
  }
}