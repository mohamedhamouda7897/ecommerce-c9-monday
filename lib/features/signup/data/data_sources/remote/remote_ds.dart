import 'package:dartz/dartz.dart';
import '../../../../../core/error/failuers.dart';
import '../../models/UserModel.dart';
import '../../models/request_data.dart';

abstract class RemoteDataSource {
  Future<Either<Failures, UserModel>> signUp(RequestData requestData);
}
