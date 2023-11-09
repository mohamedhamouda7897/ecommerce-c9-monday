import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/data/data_sources/home_remote_ds.dart';
import 'package:ecommerce_c9_monday/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:ecommerce_c9_monday/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDS homeRemoteDS;

  HomeRepoImpl(this.homeRemoteDS);

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getBrands() {
    return homeRemoteDS.getBrands();
  }

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getCategory() {
    return homeRemoteDS.getCategory();
  }
}
