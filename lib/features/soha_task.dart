//task here

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  static const routName = 'Product Details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xff06004F)),
        centerTitle: true,
        title: Text(
          "Product Details",
          style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: const Color(0xff06004F),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Color(0xff06004F),
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
                color: Color(0xff06004F),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                        color: const Color(0xff004182).withOpacity(.3),
                        width: 2.w)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      "assets/product.png",
                      height: 300.h,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Text(
                    "Nike Air Jordon",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: const Color(0xff06004F)),
                  ),
                  const Spacer(),
                  Text(
                    "EGP 3,500",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: const Color(0xff06004F)),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    height: 34.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            width: 1.h,
                            color: const Color(0xff004182).withOpacity(.3))),
                    child: Center(
                      child: Text(
                        '3,230 Sold',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xff06004F)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Icon(
                    Icons.star,
                    color: const Color(0xffFDD835),
                    size: 15.h,
                  ),
                  Text(
                    ' 4.8 (7,500)',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0xff06004F)),
                  ),
                  SizedBox(
                    width: 66.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 11.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: const Color(0xff004182),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              width: 22.r,
                              height: 22.r,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(11.r)),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '4',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              width: 22.r,
                              height: 22.r,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(11.r)),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: const Color(0xff06004F)),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories......Read More ",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xff06004F).withOpacity(.6)),
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Total Price',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: const Color(0xff06004F).withOpacity(.6))),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'EGP 3,500',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff06004F)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),



                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            backgroundColor: const Color(0xff004182),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 32.w)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.add_shopping_cart_outlined),
                            SizedBox(
                              width: 26.w,
                            ),
                            Text(
                              'Add to cart',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

