import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failuers.dart';
import '../../models/MessageModel.dart';

abstract class PasswordRemoteDS {
  Future<Either<Failures, MessageModel>> forgotPassword(String? email);
}

abstract class ResetCodeDS {
  Future<Either<Failures, MessageModel>> resetCode(String? code);
}

abstract class ResetPasswordDs {
  Future<Either<Failures, MessageModel>> resetPassword(
      String? email, String? password);
}
