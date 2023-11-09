import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';

import '../../../../core/error/failuers.dart';

abstract class LoginRepo {
  Future<Either<Failures, UserEntity>> login(String email, String password);
}
