import 'package:ecommerce_c9_monday/core/utils/app_colors.dart';
import 'package:ecommerce_c9_monday/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
            padding: const EdgeInsets.only(left: 15),
            height: 22,
            width: 66,
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
                          side:
                              BorderSide(width: 1, color: AppColors.blueColor)),
                      elevation: 0,
                      child: SearchBar(
                        hintText: "What do you want to search for?",
                        hintStyle: MaterialStateProperty.resolveWith(
                            (states) => const TextStyle(color: Colors.grey)),
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
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (192 / 237),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w),
                itemBuilder: (context, index) {
                  return ProductItem(index);
                },
              ),
            )
          ],
        ));
  }
}
