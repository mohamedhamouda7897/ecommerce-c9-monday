import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/signup/data/models/UserModel.dart';

abstract class LoginRemoteDS {
  Future<Either<Failures, UserModel>> login(String email, String password);
}
