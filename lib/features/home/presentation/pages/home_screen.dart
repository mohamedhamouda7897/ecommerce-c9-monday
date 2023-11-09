import 'package:ecommerce_c9_monday/core/utils/app_colors.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/tabs/fav_tab.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/tabs/home.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/tabs/products_tab.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_manager.dart';
import '../../data/data_sources/home_remote_ds_impl.dart';
import '../../data/repositories/home_repo_impl.dart';
import '../../domain/use_cases/get_brands_use_case.dart';
import '../../domain/use_cases/get_category_use_case.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        GetBrandsUseCase(
          HomeRepoImpl(
            HomeRemoteDSImpl(
              ApiManager(),
            ),
          ),
        ),
        GetCategoryUseCase(
          HomeRepoImpl(
            HomeRemoteDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )
        ..add(HomeGetCategoryEvent())
        ..add(HomeGetBrandsEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.type == ScreenType.brandsError ||
              state.type == ScreenType.categoryFailures) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: HomeBloc.get(context).index,
              onTap: (value) {
                HomeBloc.get(context).add(HomeChangeNavBarEvent(value));
              },
              backgroundColor: AppColors.BackGround,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.production_quantity_limits_rounded),
                    label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              ],
            ),
            body: tabs[HomeBloc.get(context).index],
          );
        },
      ),
    );
  }

  List<Widget> tabs = [HomeTab(), ProductsTab(), FavTab(), ProfileTab()];
}
