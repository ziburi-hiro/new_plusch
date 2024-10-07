import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plusch/Models/account.dart';
import 'package:plusch/utils/authentication.dart';

class UserFireStore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final CollectionReference users =
  _firebaseFirestoreInstance.collection('users');

  static Future<dynamic> setUser(Account newAccount) async {
    try {
      await users.doc(newAccount.id).set({
        'name': newAccount.name,
        'postal_code': newAccount.postCode,
        'email_address':newAccount.emailAddress,
        'created_at': Timestamp.now(),
        'updated_at': Timestamp.now(),
      });
      Authentication.myAccount = newAccount;
      return true;
    } on FirebaseException catch (e) {
      //TODO エラーハンドリング実装
      return false;
    }
  }

  static Future<dynamic> getUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String, dynamic> data =
      documentSnapshot.data() as Map<String, dynamic>;
      Account myAccount = Account(
          id: uid,
          name: data['name'],
          postCode: data['postal_code'],
          emailAddress: data['email_address'],
          createdAt: data['created_at'],
          updatedAt: data['updated_at'],
      );
      Authentication.myAccount = myAccount;
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}