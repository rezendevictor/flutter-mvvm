import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:provider/provider.dart';

bool _isLoggedIn = false;

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String> signInWithGoogle(BuildContext context) async {
debugPrint("teste");
  var store = Provider.of<AppStore>(context,listen: false);

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  debugPrint(user.email);
  debugPrint("-------------------");

  store.setFirebaseUser(user);

  return "user";
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  debugPrint("user sing out");
}
