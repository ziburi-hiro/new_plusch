import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plusch/Models/account.dart';
import 'package:plusch/Models/school.dart';

class GraduatedSchoolFireStore {
  static final FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference graduatedSchools = _firebaseFirestoreInstance.collection('graduated_schools');

  static Future<dynamic> setSchool(Account account, school) async {
    try{
      await graduatedSchools.doc(account.id + school['type']).set({
        'user_id' : account.id,
        'school_id' : school['schoolId'],
        'type' : school['type'],
        'enrollment_year' : school['enrollmentYear'],
        'graduation_year' : school['graduationYear'],
        'rate': school['rate'],
        'reason' : school['reason'],
      });
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }

  static dynamic getGraduatedSchool(Account account, String type) async {
    var documentSnapshot = await graduatedSchools
        .where('user_id', isEqualTo: account.id)
        .where('type', isEqualTo: type)
        .get();

    if (documentSnapshot.docs.isEmpty){
      return null;
    }else{
      Map data = documentSnapshot.docs[0].data() as Map;

      School? school;
      await School.getSchool(data["school_id"]).then((value) => school = value);

      return school;
    }
  }

  static dynamic getGraduatedSchoolDetail(Account account, String type) async {
    var documentSnapshot = await graduatedSchools
        .where('user_id', isEqualTo: account.id)
        .where('type', isEqualTo: type)
        .get();

    if (documentSnapshot.docs.isEmpty) {
      return null;
    } else {
      Map data = documentSnapshot.docs[0].data() as Map;

      return data;
    }
  }
}