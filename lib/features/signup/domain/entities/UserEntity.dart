class UserEntity {
  UserEntity({
    this.user,
    this.token,
  });

  UserDataEntity? user;
  String? token;
}

class UserDataEntity {
  UserDataEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
