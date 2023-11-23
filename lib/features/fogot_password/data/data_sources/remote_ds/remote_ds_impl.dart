import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_c9_monday/features/fogot_password/data/data_sources/remote_ds/remote_ds.dart';
import '../../../../../../../core/api/api_manager.dart';
import '../../../../../../../core/api/end_points.dart';
import '../../../../../../../core/error/failuers.dart';
import '../../../../signup/data/models/ErrorModel.dart';
import '../../models/MessageModel.dart';

class PasswordRemoteDSImpl implements PasswordRemoteDS {
  ApiManager apiManager;
  PasswordRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, MessageModel>> forgotPassword(String? email) async {
    try {
      Response response = await apiManager
          .postData(endPoint: EndPoints.forgotPassword, body: {"email": email});
      MessageModel messageModel = MessageModel.fromJson(response.data);
      return Right(messageModel);
    } on DioException catch (e) {
      Map<String, dynamic> response = jsonDecode(e.response.toString());
      ErrorModel errorModel = ErrorModel.fromJson(response);

      return Left(RemoteFailure(errorModel.message ?? ""));
    }
  }
}

class ResetCodeDsImpl implements ResetCodeDS {
  ApiManager apiManager;
  ResetCodeDsImpl(this.apiManager);

  @override
  Future<Either<Failures, MessageModel>> resetCode(String? code) async {
    try {
      Response response = await apiManager
          .postData(endPoint: EndPoints.resetCode, body: {"resetCode": code});
      MessageModel messageModel = MessageModel.fromJson(response.data);
      return Right(messageModel);
    } on DioException catch (e) {
      Map<String, dynamic> response = jsonDecode(e.response.toString());
      ErrorModel errorModel = ErrorModel.fromJson(response);
      return Left(RemoteFailure(errorModel.message ?? ""));
    }
  }
}

class ResetPasswordDsImpl implements ResetPasswordDs {
  ApiManager apiManager;
  ResetPasswordDsImpl(this.apiManager);

  @override
  Future<Either<Failures, MessageModel>> resetPassword(
      String? email, String? password) async {
    try {
      Response response = await apiManager.putData(
          endPoint: EndPoints.resetPassword,
          body: {"email": email, "newPassword": password});

      MessageModel messageModel = MessageModel.fromJson(response.data);
      return Right(messageModel);
    } on DioException catch (e) {
      Map<String, dynamic> response = jsonDecode(e.response.toString());
      ErrorModel errorModel = ErrorModel.fromJson(response);
      return Left(RemoteFailure(errorModel.message ?? ""));
    }
  }
}
