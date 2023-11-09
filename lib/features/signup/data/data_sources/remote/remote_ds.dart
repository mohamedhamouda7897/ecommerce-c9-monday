import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/features/signup/data/models/UserModel.dart';

import '../../../../../core/error/failuers.dart';
import '../../models/request_data.dart';

abstract class RemoteDataSource {
  Future<Either<Failures, UserModel>> signUp(RequestData requestData);
}
