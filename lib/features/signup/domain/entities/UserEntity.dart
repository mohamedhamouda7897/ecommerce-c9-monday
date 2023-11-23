import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  UserEntity({this.user, this.token});

  UserEntityData? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user, token];
}

class UserEntityData extends Equatable {
  UserEntityData({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  @override
  // TODO: implement props
  List<Object?> get props => [name, email];
}
