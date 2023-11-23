import 'package:dartz/dartz.dart';
import '../../../../core/error/failuers.dart';
import '../../domain/repositories/forgot_repo.dart';
import '../data_sources/remote_ds/remote_ds.dart';
import '../models/MessageModel.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  ResetPasswordDs resetPasswordDs;

  ResetPasswordRepoImpl(this.resetPasswordDs);

  @override
  Future<Either<Failures, MessageModel>> resetPasswordRepo(
          String? email, String? password) =>
      resetPasswordDs.resetPassword(email, password);
}
