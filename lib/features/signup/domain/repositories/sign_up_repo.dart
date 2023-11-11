import 'package:dartz/dartz.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/request_data.dart';
import '../entities/UserEntity.dart';

abstract class SignUpRepo {
  Future<Either<Failures, UserEntity>> signUp(RequestData requestData);
}
