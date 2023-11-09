import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/features/login/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce_c9_monday/features/login/domain/repositories/login_repo.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';

import '../../../../core/error/failuers.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRemoteDS loginRemoteDS;

  LoginRepoImpl(this.loginRemoteDS);

  @override
  Future<Either<Failures, UserEntity>> login(String email, String password) {
    return loginRemoteDS.login(email, password);
  }
}
