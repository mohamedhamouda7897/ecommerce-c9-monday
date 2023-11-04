import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/ProductModel.dart';

abstract class ProductListRepo {
  Future<Either<Failures, ProductModel>> getProductList();
}
