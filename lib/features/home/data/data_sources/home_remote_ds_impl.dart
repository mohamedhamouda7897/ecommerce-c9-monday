import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_c9_monday/core/api/api_manager.dart';
import 'package:ecommerce_c9_monday/core/api/end_points.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/data/data_sources/home_remote_ds.dart';
import 'package:ecommerce_c9_monday/features/home/data/models/CartModel.dart';
import 'package:ecommerce_c9_monday/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDS)
class HomeRemoteDSImpl implements HomeRemoteDS {
  ApiManager apiManager;

  HomeRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getBrands() async {
    try {
      Response response = await apiManager.getData(
        endPoint: EndPoints.getBrands,
      );
      CategoryAndBrandModel model =
      CategoryAndBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getCategory() async {
    try {
      Response response = await apiManager.getData(
        endPoint: EndPoints.getCategory,
      );
      CategoryAndBrandModel model =
      CategoryAndBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartModel>> addToCard(String id, String token) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.cart, body: {"productId": id}, token: token);

      CartModel cartModel = CartModel.fromJson(response.data);
      return Right(cartModel);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
}
