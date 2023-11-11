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
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

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
            Navigator.pushNamed(context, AppRoute.homeScreen);
          }
          if (state.screenStatus == ScreenStatus.failure) {
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
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blueColor,
            body: Padding(
              padding: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/route.png"),
                    const Text("Welcome Back To Route",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    const Text("Please sign in with your email",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    SizedBox(height: 70.h),
                    const Text("UserName",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your email'),
                          controller: LoginBloc.get(context).emailController,
                          keyboardType: TextInputType.emailAddress,
                        )),
                    SizedBox(height: 40.h),
                    const Text("Password",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your password'),
                          controller: LoginBloc.get(context).passwordController,
                          obscureText: true,
                        )),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.forgotPassword);
                      },
                      child: const Text("Forgot Password",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40.h),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginBloc.get(context).add(LoginButtonEvent());
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(15.h.w),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.blueColor),
                            ),
                          )),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18.sp)),
                        SizedBox(width: 10.w),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, AppRoute.signUp, (route) => false);
                              LoginBloc.get(context).emailController.text = "";
                              LoginBloc.get(context).passwordController.text =
                                  "";
                            },
                            child: Text("Create Account",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp))),
                      ],
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
