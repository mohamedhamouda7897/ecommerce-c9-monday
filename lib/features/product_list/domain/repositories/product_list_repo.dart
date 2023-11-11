import 'package:dartz/dartz.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/ProductModel.dart';

abstract class ProductListRepo {
  Future<Either<Failures, ProductModel>> getProductList();
}
