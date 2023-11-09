import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/features/signup/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/repositories/signup_repo.dart';

import '../../../../core/error/failuers.dart';
import '../models/request_data.dart';

class SignUpRepoImpl implements SignupRepo {
  RemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, UserEntity>> signUp(RequestData requestData) =>
      remoteDataSource.signUp(requestData);
}
