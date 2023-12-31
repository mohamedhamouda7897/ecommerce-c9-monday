part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeGetCategoryEvent extends HomeEvent {}

class HomeGetBrandsEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  String id;

  AddToCartEvent(this.id);
}

class HomeChangeNavBarEvent extends HomeEvent {
  int index;

  HomeChangeNavBarEvent(this.index);
}
