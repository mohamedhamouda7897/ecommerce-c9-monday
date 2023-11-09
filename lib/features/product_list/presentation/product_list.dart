import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../product_item.dart';
import 'bloc/product_list_bloc.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListBloc(),
      child: BlocConsumer<ProductListBloc, ProductListState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductListBloc.get(context).add(GetAllProducts());

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                padding: EdgeInsets.only(left: 15.w),
                height: 22.h,
                width: 66.w,
                child: Image.asset(
                  "assets/images/route_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.w, left: 16.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              side: BorderSide(
                                  width: 1.w, color: AppColors.blueColor)),
                          elevation: 0,
                          child: SearchBar(
                            hintText: "What do you want to search for?",
                            hintStyle: MaterialStateProperty.resolveWith(
                                (states) =>
                                    const TextStyle(color: Colors.grey)),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 10.h)),
                            // controller: controller,
                            onTap: () {
                              // controller.openView();
                            },
                            onChanged: (_) {
                              // controller.openView();
                            },
                            leading: Icon(
                              Icons.search,
                              size: 24.sp,
                              color: AppColors.blueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 13.w),
                      child: Icon(Icons.shopping_cart_outlined,
                          size: 24.sp, color: AppColors.blueColor),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: GridView.builder(
                    itemCount: state.productModel?.data?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (192 / 237),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w),
                    itemBuilder: (context, index) {
                      return ProductItem(
                          productModel: state.productModel, index: index);
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
