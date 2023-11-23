import 'package:dartz/dartz.dart';
import '../../../../core/error/failuers.dart';
import '../../domain/repositories/forgot_repo.dart';
import '../data_sources/remote_ds/remote_ds.dart';
import '../models/MessageModel.dart';

class ForgotRepoImpl implements ForgotPasswordRepo {
  PasswordRemoteDS passwordRemoteDS;
  ForgotRepoImpl(this.passwordRemoteDS);

  @override
  Future<Either<Failures, MessageModel>> forgotPassword(String? email) =>
      passwordRemoteDS.forgotPassword(email);
}
