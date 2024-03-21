import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  String name;
  String postCode;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  Account(
      {required this.id,
        required this.name,
        required this.postCode,
        this.createdAt,
        this.updatedAt
      });
}