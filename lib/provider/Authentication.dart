import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String studentID;
  String name;
  String email;
  String imageUrl;

//TODO: Output Authentication errors in the login screen
//Todo: Implement Registration

  Future<bool> SignInWithCredentials(String email, String password) async {
    try {
      UserCredential authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email,
          password: password
      );
      final User user = authResult.user;
      if(await SetUser(user) == true)
        return true;
      else {
        print("problems with seting the user");
        return false;
      }
     } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Other Authentication Problem');
      }
      return false;
    }
    return false;
  }

  Future<bool> SetUser(User user) async {
    String displayedName, photoUrl;
    if (user != null) {
      assert(await user.getIdToken() != null);
      assert(user.uid != null);
      assert(user.email != null);
      displayedName = user.displayName != null ? user.displayName : "unknown person";
      photoUrl = user.photoURL != null ? user.photoURL : displayedName[0];
      studentID = user.uid;
      name = displayedName;
      email = user.email;
      imageUrl = photoUrl;

      if (name.contains(" ")) {
        name = name.substring(0, name.indexOf(" "));
      }
      return true;
    }
    return false;
  }

  Future<String> signInWithGoogle() async {
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
    try {
      await SetUser(user);
      return "Signed in With Google";
    } catch (e) {
      return e;
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

}