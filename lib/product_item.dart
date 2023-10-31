import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  int index;
  ProductItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: index.isEven ? 16.w : 0, right: index.isOdd ? 16.w : 0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
            side: BorderSide(width: 2.w, color: Colors.blueGrey)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.sp),
                    topRight: Radius.circular(15.sp),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                // color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 10.w),
                  child: Stack(
                    // alignment: Alignment.centerRight,
                    children: [
                      Image.network(
                        "https://static.nike.com/a/images/t_default/08b60b99-1dfc-4949-8903-d75ef3d7e39d/cortez-shoes.png",
                        fit: BoxFit.cover,
                        height: 191.h,
                        width: 128.w,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          // margin: const EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(2.h.w),

                          margin: EdgeInsets.only(left: 6.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: Icon(
                            Icons.favorite_outline,
                            color: AppColors.blueColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: const Text("Product Description"),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    const Text("EGP 1000"),
                    SizedBox(width: 16.w),
                    const Text("EGP 1200"),
                  ],
                ),
                SizedBox(height: 5.h),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, bottom: 13.h, right: 8.w),
                  child: Row(
                    children: [
                      const Text("Review"),
                      SizedBox(width: 4.w),
                      const Text("(4.6)"),
                      SizedBox(width: 4.w),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const Spacer(),
                      Container(
                          padding: EdgeInsets.all(5.w.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.sp),
                            color: AppColors.blueColor,
                          ),
                          child: const Icon(Icons.add, color: Colors.white))
                    ],
                  ),
                )
              ],
            ))

            // ),
          ],
        ),
      ),
    );
  }
}
