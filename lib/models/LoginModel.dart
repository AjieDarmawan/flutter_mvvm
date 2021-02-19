// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
    this.status,
    this.userId,
    this.idEmployee,
    this.firstName,
    this.email,
    this.password,
    this.picture,
    this.profilePower,
  });

  String message;
  int status;
  String userId;
  String idEmployee;
  String firstName;
  String email;
  String password;
  dynamic picture;
  String profilePower;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        status: json["status"],
        userId: json["user_id"],
        idEmployee: json["id_employee"],
        firstName: json["firstName"],
        email: json["email"],
        password: json["password"],
        picture: json["picture"],
        profilePower: json["profile_power"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "user_id": userId,
        "id_employee": idEmployee,
        "firstName": firstName,
        "email": email,
        "password": password,
        "picture": picture,
        "profile_power": profilePower,
      };
}
