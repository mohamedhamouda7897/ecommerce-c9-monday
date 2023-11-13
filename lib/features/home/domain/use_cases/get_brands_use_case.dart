import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:ecommerce_c9_monday/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  HomeRepo homeRepo;

  GetBrandsUseCase(this.homeRepo);

  Future<Either<Failures, CategoryAndBrandEntity>> call() =>
      homeRepo.getBrands();
}
