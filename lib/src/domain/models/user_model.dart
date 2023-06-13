import 'dart:convert';

class UserModel {
  final String userId;
  final String email;
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'user_id': userId,
      'name': name,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'profile_pic': profilePic,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String?,
      age: map['age'] as int?,
      gender: map['gender'] as String?,
      height: map['height'] as int?,
      weight: map['weight'] as int?,
      profilePic: map['profile_pic'] as String?,
      email: map['email'] as String,
      phone: map['phone'] as int?,
      userId: map['user_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
