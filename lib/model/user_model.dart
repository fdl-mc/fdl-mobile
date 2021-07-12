import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final int balance;
  late final String name;
  late final String uid;

  UserModel({required this.balance, required this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.balance = json['balance'];
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot ds) {
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    this.uid = ds.id;
    this.name = data['name'];
    this.balance = data['balance'];
  }
}
