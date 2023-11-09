import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../signup/domain/entities/UserEntity.dart';
import '../../data/models/ProductModel.dart';
import '../repositories/product_list_repo.dart';

class ProductListUseCase {
  ProductListRepo productListRepo;

  ProductListUseCase(this.productListRepo);
  Future<Either<Failures, ProductModel>> call() =>
      productListRepo.getProductList();
}
