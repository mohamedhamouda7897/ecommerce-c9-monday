import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(width: 2.w, color: Colors.blueGrey)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10),
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
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
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
          SizedBox(height: 7.h),
          Expanded(
              child: Column(
            children: [
              const Text("Product Description"),
              Row(
                children: [
                  SizedBox(width: 5.w),
                  const Text("EGP 1000"),
                  SizedBox(width: 20.w),
                  const Text("EGP 1200"),
                ],
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Review (4.6)"),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const Spacer(),
                    Container(
                        padding: const EdgeInsets.all(5),
                        // margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.blueColor,
                        ),
                        child: const Icon(Icons.add, color: Colors.white))
                  ],
                ),
              )
            ],
          ))

          //   children: [Text("Review (4.6)"), Icon(Icons.star)],
          // ),
        ],
      ),
    );
  }
}
