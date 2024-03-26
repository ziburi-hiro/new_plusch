import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  String name;
  String postCode;
  String emailAddress;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  Account(
      {required this.id,
        required this.name,
        required this.postCode,
        required this.emailAddress,
        this.createdAt,
        this.updatedAt
      });
}