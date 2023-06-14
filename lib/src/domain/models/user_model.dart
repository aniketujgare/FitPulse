// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String email;
  final String userId;
  String? name;
  int? age;
  String? gender;
  int? height;
  int? weight;
  String? profilePic;
  int? phone;

  UserModel({
    required this.email,
    required this.userId,
    this.name,
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.profilePic,
    this.phone,
  });

  UserModel copyWith({
    String? email,
    String? userId,
    String? name,
    int? age,
    String? gender,
    int? height,
    int? weight,
    String? profilePic,
    int? phone,
  }) =>
      UserModel(
        email: email ?? this.email,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        profilePic: profilePic ?? this.profilePic,
        phone: phone ?? this.phone,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        userId: json["user_id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        profilePic: json["profile_pic"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "user_id": userId,
        "name": name,
        "age": age,
        "gender": gender,
        "height": height,
        "weight": weight,
        "profile_pic": profilePic,
        "phone": phone,
      };
}
