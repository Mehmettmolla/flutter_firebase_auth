import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/service/auth_service.dart';

class EmailPasswordAuth {
 final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future signUpWithEmailPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future signOutWithEmailPassword()async{
  await FirebaseAuth.instance.signOut();
  }
}
