import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';

class UserModel extends UserEntity {
  UserModel({
    this.message,
    super.user,
    super.token,
  });

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
}

class User extends UserDataEntity {
  User({
    super.name,
    super.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
