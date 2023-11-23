import 'package:dartz/dartz.dart';
import '../../../../core/error/failuers.dart';
import '../../domain/repositories/forgot_repo.dart';
import '../data_sources/remote_ds/remote_ds.dart';
import '../models/MessageModel.dart';

class ResetCodeRepoImpl implements ResetCodeRepo {
  ResetCodeDS resetCodeDS;
  ResetCodeRepoImpl(this.resetCodeDS);

  @override
  Future<Either<Failures, MessageModel>> resetCode(String? code) =>
      resetCodeDS.resetCode(code);
}
