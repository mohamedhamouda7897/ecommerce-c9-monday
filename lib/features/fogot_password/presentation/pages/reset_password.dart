import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../product_list/presentation/bloc/product_list_bloc.dart';
import '../manager/forgot_password_screen_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();

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
                      height: 140.h,
                      child: Column(
                        children: [
                          const Text(
                              "You have changed your password successfully"),
                          SizedBox(height: 30.h),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, AppRoute.logIn, (route) => false);
                              },
                              child: const Text("Go to login page")),
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
                  height: 140.h,
                  child: Column(
                    children: [
                      Text(state.failures?.message ?? "unknown error occurred",
                          maxLines: 2,
                          style: const TextStyle(color: Colors.red)),
                      SizedBox(height: 30.h),
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
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoute.logIn, (route) => false);
                  },
                  child: const Icon(Icons.arrow_back_outlined)),
              backgroundColor: AppColors.blueColor,
              elevation: 0,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blueColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/route.png"),
                    SizedBox(height: 40.h),
                    const Text("Reset your account password",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    SizedBox(height: 20.h),
                    const Text("Enter your email",
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
                              .emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'enter the email here'),
                        )),
                    SizedBox(height: 20.h),
                    const Text("Enter  new password",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(height: 20.h),
                    Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            final bool passwordValid = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value);
                            if (!passwordValid) {
                              return "please enter a valid password";
                            }
                            return null;
                          },
                          controller: ForgotPasswordScreenBloc.get(context)
                              .passwordController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'enter the new password here'),
                        )),
                    SizedBox(height: 20.h),
                    const Text("Re-enter  new password",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(height: 20.h),
                    Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white),
                        child: TextFormField(
                          validator: (value) {
                            if (value !=
                                ForgotPasswordScreenBloc.get(context)
                                    .passwordController
                                    .text) {
                              return "passwords does not match";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Re-enter password'),
                        )),
                    Container(
                      padding: EdgeInsets.all(35.h.w),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0.r),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ForgotPasswordScreenBloc.get(context)
                                  .add(ResetPasswordClicked());
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(15.h.w),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppColors.blueColor),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
