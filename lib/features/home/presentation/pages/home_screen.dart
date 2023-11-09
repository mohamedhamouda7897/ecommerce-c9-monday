import 'package:ecommerce_c9_monday/core/utils/app_colors.dart';
import 'package:ecommerce_c9_monday/features/home/domain/use_cases/add_to_cart_usecase.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/tabs/fav_tab.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/tabs/home.dart';
import 'package:ecommerce_c9_monday/features/home/presentation/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/api/api_manager.dart';
import '../../../product_list/presentation/bloc/product_list_bloc.dart';
import '../../../product_list/presentation/pages/product_list.dart';
import '../../data/data_sources/home_remote_ds_impl.dart';
import '../../data/repositories/home_repo_impl.dart';
import '../../domain/use_cases/get_brands_use_case.dart';
import '../../domain/use_cases/get_category_use_case.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
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
                AddCartUseCase(
                  HomeRepoImpl(
                    HomeRemoteDSImpl(
                      ApiManager(),
                    ),
                  ),
                ))
              ..add(HomeGetCategoryEvent())
              ..add(HomeGetBrandsEvent())),
        BlocProvider(
          create: (context) => ProductListBloc()..add(GetAllProducts()),
        )
      ],
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
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leadingWidth: 83.w,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset('assets/images/route.svg'),
              ),
            ),
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
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5.h),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF06004E),
                              ),
                              hintText: 'what do you search for?',
                              hintStyle: TextStyle(
                                color: Color(0x9906004E),
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          HomeBloc.get(context)
                              .add(AddToCartEvent("6428ebc6dc1175abc65ca0b9"));
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30.0.sp,
                          color: Color(0xff004182),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(child: tabs[HomeBloc.get(context).index]),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> tabs = [HomeTab(), ProductListScreen(), FavTab(), ProfileTab()];
}
