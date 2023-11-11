import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_c9_monday/features/signup/data/data_sources/remote/remote_ds.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/error/failuers.dart';
import '../../models/ErrorModel.dart';
import '../../models/UserModel.dart';
import '../../models/request_data.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  ApiManager apiManager;
  RemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, UserModel>> signUp(RequestData requestData) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.signUp, body: requestData.toJson());
      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } on DioException catch (e) {
      Map<String, dynamic> response = jsonDecode(e.response.toString());
      ErrorModel errorModel = ErrorModel.fromJson(response);
      if (errorModel.message == "fail") {
        return Left(RemoteFailure(errorModel.errors?.msg ?? "Error"));
      } else {
        return Left(RemoteFailure(errorModel.message ?? "Error"));
      }
    }
  }
}
