import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../product_list/presentation/bloc/product_list_bloc.dart';
import '../manager/forgot_password_screen_bloc.dart';

class ResetCode extends StatelessWidget {
  const ResetCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordScreenBloc(),
      child: BlocConsumer<ForgotPasswordScreenBloc, ForgotPasswordScreenState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.blueGrey)),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          } else if (state.screenStatus == ScreenStatus.successfully) {
            Navigator.pop(context);
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("success",
                        style: TextStyle(color: Colors.green, fontSize: 18)),
                    elevation: 0,
                    content: SizedBox(
                      height: 100.h,
                      child: Column(
                        children: [
                          Text("${state.messageModel?.status}"),
                          SizedBox(height: 20.h),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    AppRoute.resetPassword, (route) => false);
                              },
                              child: const Text("OK")),
                        ],
                      ),
                    ),
                  );
                });
          } else if (state.screenStatus == ScreenStatus.failures) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error", style: TextStyle(fontSize: 18)),
                elevation: 0,
                content: SizedBox(
                  height: 130.h,
                  child: Column(
                    children: [
                      Text(state.failures?.message ?? "unknown error occurred",
                          maxLines: 3,
                          style: const TextStyle(color: Colors.red)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(backgroundColor: AppColors.blueColor, elevation: 0),
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blueColor,
            body: Padding(
              padding: EdgeInsets.all(30.w.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50.h),
                  Image.asset("assets/images/route.png"),
                  SizedBox(height: 80.h),
                  const Text("Find your account",
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  SizedBox(height: 50.h),
                  const Text("Enter reset code you have received",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 20.h),
                  Container(
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white),
                      child: TextFormField(
                        controller: ForgotPasswordScreenBloc.get(context)
                            .codeController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'enter the code here'),
                      )),
                  Container(
                    padding: EdgeInsets.all(50.h.w),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0.r),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          ForgotPasswordScreenBloc.get(context)
                              .add(ResetCodeClicked());
                        },
                        child: Padding(
                          padding: EdgeInsets.all(15.h.w),
                          child: Text(
                            "Confirm code",
                            style: TextStyle(
                                fontSize: 20.sp, color: AppColors.blueColor),
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
