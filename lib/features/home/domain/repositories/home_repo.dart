import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/domain/entities/CategoryAndBrandEntity.dart';

abstract class HomeRepo {
  Future<Either<Failures, CategoryAndBrandEntity>> getCategory();

  Future<Either<Failures, CategoryAndBrandEntity>> getBrands();
}
