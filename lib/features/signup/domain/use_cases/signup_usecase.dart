import 'package:ecommerce_c9_monday/features/signup/domain/repositories/signup_repo.dart';

import '../../data/models/request_data.dart';
import '../entities/UserEntity.dart';

class SignUpUseCase {
  SignupRepo signupRepo;

  SignUpUseCase(this.signupRepo);

  Future<UserEntity> call(RequestData requestData) =>
      signupRepo.signUp(requestData);
}
