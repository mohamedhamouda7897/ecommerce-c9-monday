import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/product_list_repo.dart';
import '../data_sources/remote_ds/product_list_ds.dart';
import '../models/ProductModel.dart';

class ProductListRepoImpl implements ProductListRepo {
  ProductRemoteDS productRemoteDS;

  ProductListRepoImpl(this.productRemoteDS);

  @override
  Future<Either<Failures, ProductModel>> getProductList() =>
      productRemoteDS.getProducts();
}
