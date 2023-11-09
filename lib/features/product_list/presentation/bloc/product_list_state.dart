part of 'product_list_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  successfully,
  failures,
}

class ProductListState {
  final ScreenStatus? screenStatus;
  final ProductModel? productModel;
  final Failures? failures;

  ProductListState({this.screenStatus, this.productModel, this.failures});

  ProductListState copyWith(
      {ScreenStatus? screenStatus,
      ProductModel? productModel,
      Failures? failures}) {
    return ProductListState(
        screenStatus: screenStatus ?? this.screenStatus,
        productModel: productModel ?? this.productModel,
        failures: failures);
  }
}

class ProductListInitial extends ProductListState {
  ProductListInitial() : super(screenStatus: ScreenStatus.init);
}
