import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/add_to_cart_usecase.dart';
import '../../domain/use_cases/get_brands_use_case.dart';
import '../../domain/use_cases/get_category_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetBrandsUseCase getBrandUseCase;
  GetCategoryUseCase getCategoryUseCase;

  AddCartUseCase addCartUseCase;

  int index = 0;

  static HomeBloc get(context) => BlocProvider.of(context);

  HomeBloc(this.getBrandUseCase, this.getCategoryUseCase, this.addCartUseCase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeGetBrandsEvent) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getBrandUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.brandsError, failures: l));
        }, (r) {
          emit(state.copyWith(
              type: ScreenType.brandsSuccess, brands: r.data ?? []));
        });
      } else if (event is HomeGetCategoryEvent) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getCategoryUseCase();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.categoryFailures, failures: l));
        }, (r) {
          emit(state.copyWith(
              type: ScreenType.categorySuccess, categories: r.data ?? []));
        });
      } else if (event is HomeChangeNavBarEvent) {
        index = event.index;
        emit(state.copyWith(type: ScreenType.changeNavBar));
      } else if (event is AddToCartEvent) {
        var res = await addCartUseCase(event.id);
        res.fold((l) {}, (r) {
          print("sucess");
        });
      }
    });
  }
}
