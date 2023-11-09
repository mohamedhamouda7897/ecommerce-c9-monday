import 'package:ecommerce_c9_monday/config/routes/routes.dart';
import 'package:ecommerce_c9_monday/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            );
          }
          if (state.screenStatus == ScreenStatus.successfully) {
            Navigator.pushNamed(context, AppRoute.home);
          }
          if (state.screenStatus == ScreenStatus.failures) {
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
            backgroundColor: AppColors.BackGround,
            body: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 97.w, right: 96.r, top: 91.h),
                      child: Image.asset(
                        AppImages.RouteImage,
                        color: Colors.white,
                        height: 71.h,
                        width: 237.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 86.9.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.WelcomeBack,
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(AppStrings.PleaseSignIn,
                              style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(AppStrings.Username,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                          SizedBox(
                            height: 24.h,
                          ),
                          TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.errorloginuser;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                                hintText: AppStrings.entername,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: AppColors.blackfont,
                                    ),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.transparent,
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              )),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(AppStrings.Password,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                          SizedBox(
                            height: 24.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppStrings.errorloginpassword;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: AppStrings.enterpassword,
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.blackfont),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusColor: Colors.transparent,
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(color: Colors.transparent)),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            right: 16.w,
                                            top: 20.h,
                                            bottom: 20.h),
                                        child: Icon(Icons.remove_red_eye),
                                      ))),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                  onTap: () {
                                    // Write The Function Here
                                  },
                                  child: Text(AppStrings.forgotPass,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400)))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 56.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 17.w, right: 15.w),
                      child: ElevatedButton(
                          onPressed: () {
                            LoginBloc.get(context).add(LoginButtonEvent());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 23.h, top: 23.h),
                            child: Text(
                              AppStrings.Login,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: AppColors.BackGround,
                                      fontSize: 20.sp),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.h),
                      child: Center(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.signUp);
                              },
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: AppStrings.DontHaveAcc,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                TextSpan(
                                    text: " " + 'Create Account',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ])))),
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
