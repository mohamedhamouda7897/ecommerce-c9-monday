import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/domain/entities/CategoryAndBrandEntity.dart';

import '../repositories/home_repo.dart';

class GetCategoryUseCase {
  HomeRepo homeRepo;

  GetCategoryUseCase(this.homeRepo);

  Future<Either<Failures, CategoryAndBrandEntity>> call() =>
      homeRepo.getCategory();
}
