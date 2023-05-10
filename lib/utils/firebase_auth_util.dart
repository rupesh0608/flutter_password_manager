import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:password_manager/data/enum/storage_keys.dart';
import 'package:password_manager/data/shared_preference.dart';
import 'package:password_manager/screens/home_page.dart';
import 'package:password_manager/utils/common_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

 isUserLoggedIn(){
   return auth.currentUser!=null;
}

googleSignIn(BuildContext context,
    {required Function(UserCredential result) onDataReceived}) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;
  final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken);

  // Getting users credential
  UserCredential result = await auth.signInWithCredential(authCredential);
  onDataReceived(result);
}

Future<void> googleSignOut(Function() onSuccess) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();
  onSuccess();
}
