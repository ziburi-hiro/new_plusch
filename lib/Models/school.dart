import 'package:sqflite/sqflite.dart';
import '../utils/db_provider.dart';


class School {
  String schoolId;
  String schoolName;
  String address;
  int postalCode;
  int prefectureId;

  School(
      {required this.schoolId,
        required this.schoolName,
        required this.address,
        required this.postalCode,
        required this.prefectureId,
      });

  static Future<School> getSchool(String schoolId) async {
    final Database database =  await DbProvider.initializeDatabase();

    final List<Map> maps = await database.query('schools',
        where: "uid = ?",
        whereArgs: [schoolId]);

    return School(
        schoolId: maps[0]['uid'],
        schoolName: maps[0]['name'],
        address: maps[0]['address'],
        postalCode: maps[0]['postal_code'],
        prefectureId: maps[0]['prefecture_id']
    );
  }

  static Future<List<School>> getSchoolList(int prefectureId, String city, String schoolType) async {
    final Database database =  await DbProvider.initializeDatabase();

    final List<Map> maps = await database.query('schools',
        where: "prefecture_id = ? AND type = ? AND address LIKE ?",
        whereArgs: [prefectureId, schoolType, "%$city%"]);
    return List.generate(maps.length, (i) {
      return School(
          schoolId: maps[i]['uid'],
          schoolName: maps[i]['name'],
          address: maps[i]['address'],
          postalCode: maps[i]['postal_code'],
          prefectureId: maps[i]['prefecture_id']
      );
    });
  }
}