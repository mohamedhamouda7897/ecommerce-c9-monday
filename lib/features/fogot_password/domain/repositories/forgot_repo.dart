import 'package:dartz/dartz.dart';
import '../../../../core/error/failuers.dart';
import '../../data/models/MessageModel.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failures, MessageModel>> forgotPassword(String? email);
}

abstract class ResetCodeRepo {
  Future<Either<Failures, MessageModel>> resetCode(String? code);
}

abstract class ResetPasswordRepo {
  Future<Either<Failures, MessageModel>> resetPasswordRepo(
      String? email, String? password);
}
