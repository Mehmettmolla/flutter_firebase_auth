import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/service/auth_service.dart';

class EmailPasswordAuth {
 final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future signUp(String email, String password) async {
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
  Future<void> signOut()async{
  await FirebaseAuth.instance.signOut();
  }
}
