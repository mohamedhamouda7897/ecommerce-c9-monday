import 'package:dartz/dartz.dart';
import '../../../../core/error/failuers.dart';
import '../../domain/repositories/sign_up_repo.dart';
import '../data_sources/remote/remote_ds.dart';
import '../models/UserModel.dart';
import '../models/request_data.dart';

class SignUpRepoImpl implements SignUpRepo {
  RemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, UserModel>> signUp(RequestData requestData) =>
      remoteDataSource.signUp(requestData);
}
