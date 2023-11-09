import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/repositories/signup_repo.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/request_data.dart';
import '../entities/UserEntity.dart';

class SignUpUseCase {
  SignupRepo signupRepo;

  SignUpUseCase(this.signupRepo);

  Future<Either<Failures, UserEntity>> call(RequestData requestData) =>
      signupRepo.signUp(requestData);
}
