import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String studentID;
String name;
String email;
String imageUrl;

//TODO: Somehow get userID, userEmail or anything to serve as the primaryID
Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.uid != null);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);
    studentID = user.uid;
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}
