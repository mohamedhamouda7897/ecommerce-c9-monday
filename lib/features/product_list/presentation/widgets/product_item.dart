import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../config/routes/routes.dart';
import '../../data/models/ProductModel.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final ProductModel? productModel;
  const ProductItem(
      {required this.index, required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    var product = productModel?.data?[index];
    return InkWell(
      onTap: () {
        if (product != null) {
          Navigator.of(context).pushNamed(
            AppRoute.productDetails,
            arguments: product,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: index.isEven ? 16.w : 0, right: index.isOdd ? 16.w : 0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(width: 2.w, color: Colors.blueGrey)),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  // alignment: Alignment.centerRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CachedNetworkImage(
                          imageUrl: product?.imageCover ?? "",
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 191.h,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error_outline, size: 40)),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          // margin: const EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(2.h.w),

                          margin: EdgeInsets.only(left: 6.w),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            // border:
                            //     Border.all(width: 2.w, color: Colors.blueGrey)
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            color: AppColors.blueColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      product?.brand?.name ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      productModel?.data?[index].description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SizedBox(width: 8.w),
                      Text("Egp ${product?.price.toString() ?? ""}"),
                      SizedBox(width: 16.w),
                      const Text("EGP 1200"),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  const Spacer(),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8.w, bottom: 13.h, right: 8.w),
                    child: Row(
                      children: [
                        const Text("Review"),
                        SizedBox(width: 4.w),
                        Text(product?.ratingsAverage.toString() ?? ""),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const Spacer(),
                        Container(
                            padding: EdgeInsets.all(5.w.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: AppColors.blueColor,
                            ),
                            child: const Icon(Icons.add, color: Colors.white))
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
