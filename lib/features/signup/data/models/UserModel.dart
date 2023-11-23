
import '../../domain/entities/UserEntity.dart';

class UserModel extends UserEntity {
  UserModel({this.message, super.user, super.token});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  @override
  List<Object?> get props => [super.props, message];
}

class User extends UserEntityData {
  User({
    this.role,
    super.name,
    super.email,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? role;
  @override
  List<Object?> get props => [super.props, role];
}
