import 'package:flutter/material.dart';

class UserModel {
  int id;
  String name;
  String username;
  String email;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['id'] ?? 0,
      name: json['data']['name'] ?? "",
      username: json['data']['username'] ?? "",
      email: json['data']['email'] ?? "",
    );
  }
}