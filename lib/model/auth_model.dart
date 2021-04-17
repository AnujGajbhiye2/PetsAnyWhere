// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.message,
    this.user,
    this.success,
  });

  String message;
  User user;
  bool success;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "success": success,
  };
}

class User {
  User({
    this.id,
  });

  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}