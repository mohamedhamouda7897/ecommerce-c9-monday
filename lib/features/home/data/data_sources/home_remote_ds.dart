import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/data/models/CategoryAndBrandModel.dart';

abstract class HomeRemoteDS {
  Future<Either<Failures, CategoryAndBrandModel>> getCategory();

  Future<Either<Failures, CategoryAndBrandModel>> getBrands();
}
