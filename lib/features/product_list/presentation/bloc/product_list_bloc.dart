import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/error/failures.dart';
import '../../data/data_sources/remote_ds/product_list_ds.dart';
import '../../data/data_sources/remote_ds/product_list_ds_impl.dart';
import '../../data/models/ProductModel.dart';
import '../../data/repositories/product_list_repo_impl.dart';
import '../../domain/repositories/product_list_repo.dart';
import '../../domain/use_cases/product_list_use_case.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  static ProductListBloc get(context) => BlocProvider.of(context);
  ProductListBloc() : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      ApiManager apiManager = ApiManager();
      ProductRemoteDS productRemoteDS = ProductRemoteDSImpl(apiManager);
      ProductListRepo productListRepo = ProductListRepoImpl(productRemoteDS);
      ProductListUseCase productListUseCase =
          ProductListUseCase(productListRepo);
      var result = await productListUseCase.call();
      result.fold((l) {
        emit(state.copyWith(screenStatus: ScreenStatus.failures, failures: l));
      }, (r) {
        emit(state.copyWith(
            screenStatus: ScreenStatus.successfully, productModel: r));
      });
    });
  }
}
