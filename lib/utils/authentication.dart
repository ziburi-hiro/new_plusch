import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusch/Models/account.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;
  static Account? myAccount;

  static Future<dynamic> signUp(
      {required String email, required String pass}) async {
    try {
      UserCredential newAccount = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
      return newAccount;
    } on FirebaseAuthException catch (e) {
      // TODO エラーメッセージ実装
      print(e);
      return false;
    }
  }

  static Future<dynamic> emailSignIn(
      {required String email, required String pass}) async {
    try {
      final UserCredential _result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass);
      currentFirebaseUser = _result.user;
      return _result;
    } on FirebaseAuthException catch (e) {
      //  TODO エラーメッセージ実装
      return false;
    }
  }

  static Future<dynamic> deleteUser() async {
    try {_firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch(e) {
      if (e.code == 'requires-recent-login') {
        print('The user must reauthenticate before this operation can be executed.');
      }
    }
  }
}