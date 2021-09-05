// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
//created using https://app.quicktype.io/
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.usn,
    this.name,
    this.phone,
    this.email,
    this.branch,
    this.password,
  });

  String usn;
  String name;
  String phone;
  String email;
  String branch;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    usn: json["usn"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    branch: json["branch"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "usn": usn,
    "name": name,
    "phone": phone,
    "email": email,
    "branch": branch,
    "password": password,
  };
}
