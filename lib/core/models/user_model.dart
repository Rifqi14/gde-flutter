import 'package:flutter/material.dart';

class UserModel {
  int id;
  String name;
  String username;
  int balance;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.balance
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      balance: json['balance'] ?? ""
    );
  }
}