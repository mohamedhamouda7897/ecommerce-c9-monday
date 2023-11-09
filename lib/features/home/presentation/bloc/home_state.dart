part of 'home_bloc.dart';

enum ScreenType {
  init,
  loading,
  brandsSuccess,
  brandsError,
  categorySuccess,
  categoryFailures,
  changeNavBar
}

@immutable
class HomeState {
  ScreenType? type;
  Failures? failures;
  List<DataEntity>? brands;
  List<DataEntity>? categories;

  HomeState({this.type, this.failures, this.brands, this.categories});

  HomeState copyWith(
      {ScreenType? type,
      Failures? failures,
      List<DataEntity>? brands,
      List<DataEntity>? categories}) {
    return HomeState(
        type: type ?? this.type,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        failures: failures ?? this.failures);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(type: ScreenType.init);
}
