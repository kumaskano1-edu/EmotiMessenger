import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//TESTING PURPOSES
String getingCurrentUser() {
  return _auth.currentUser.displayName;
}

//TODO: Error Output in the Login Screen, Sign Out Button
//TODO: FIND A WAY TO PROPERLY LOGOUT
Future<User> SignUpWithCredentials(String name, String email, String password) async {
  try {
    User user;
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
    .then((result) { user = result.user;});

    await user.updateProfile(displayName: name);
    await user.reload();
    return user;
  } on FirebaseAuthException catch(e) {
    throw Exception(e.code);
  }
}

Future<User> SignInWithCredentials(String email, String password) async {
  try {
    UserCredential authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email,
        password: password
    );
    final User user = authResult.user;
    return user;
   } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
  }
}


Future<User> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
      .authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(
      credential);
  final User user = authResult.user;
  return user;
}

Future<bool> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } on Exception catch(e) {
    throw Exception(e);
  }
}
