import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/login_repo.dart';

@injectable
class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<Failures, UserEntity>> call(String email, String password) =>
      loginRepo.login(email, password);
}
