import 'package:dartz/dartz.dart';

import '../../../../../core/error/failuers.dart';
import '../../models/ProductModel.dart';

abstract class ProductRemoteDS {
  Future<Either<Failures, ProductModel>> getProducts();
}
