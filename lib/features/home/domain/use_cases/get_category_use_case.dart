import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repo.dart';

@injectable
class GetCategoryUseCase {
  HomeRepo homeRepo;

  GetCategoryUseCase(this.homeRepo);

  Future<Either<Failures, CategoryAndBrandEntity>> call() =>
      homeRepo.getCategory();
}
