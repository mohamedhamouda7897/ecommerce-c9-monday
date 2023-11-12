import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
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
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("success",
                        style: TextStyle(color: Colors.green, fontSize: 18)),
                    elevation: 0,
                    content: SizedBox(
                      height: 150.h,
                      child: Column(
                        children: [
                          Text(
                              "Registration done, Welcome ${state.userEntity?.user?.name}"),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, AppRoute.logIn, (route) => false);
                              },
                              child: const Text("Go to sign in")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Stay here"))
                        ],
                      ),
                    ),
                  );
                });
          } else if (state.screenStatus == ScreenStatus.failure) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error", style: TextStyle(fontSize: 18)),
                elevation: 0,
                content: SizedBox(
                  height: 80.h,
                  child: Column(
                    children: [
                      Text(state.failures?.message ?? "unknown error occurred",
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
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blueColor,
            body: Padding(
              padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () => Navigator.pushNamedAndRemoveUntil(
                                context, AppRoute.logIn, (route) => false),
                            child: Icon(Icons.arrow_back))),
                    Image.asset("assets/images/route.png", height: 80.h),
                    SizedBox(height: 5.h),
                    Text("Full Name",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: TextFormField(
                          controller:
                              SignUpBloc.get(context).fullNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your full name';
                            } else if (RegExp(r'^([0-9]*[a-zA-Z]){3,}[0-9]*$')
                                    .hasMatch(value) ==
                                false) {
                              return "name must exceed 3 letters";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your full name'),
                          keyboardType: TextInputType.name,
                        )),
                    SizedBox(height: 5.h),
                    const Text("Phone Number",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white),
                        child: TextFormField(
                          controller:
                              SignUpBloc.get(context).mobileNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter mobile number';
                            }
                            final bool phoneValid =
                                RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                    .hasMatch(value);
                            if (!phoneValid) {
                              return "please enter a valid phone";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'enter your phone number'),
                          keyboardType: TextInputType.phone,
                        )),
                    SizedBox(height: 5.h),
                    const Text("E-mail Address",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 5.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white),
                        child: TextFormField(
                          controller: SignUpBloc.get(context).emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your email';
                            }
                            final bool emailValid = RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value);
                            if (!emailValid) {
                              return "please enter a valid email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'enter your email address'),
                          keyboardType: TextInputType.emailAddress,
                        )),
                    SizedBox(height: 5.h),
                    const Text("Password",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white),
                        child: TextFormField(
                          controller:
                              SignUpBloc.get(context).passwordController,
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
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your password'),
                          obscureText: true,
                        )),
                    SizedBox(height: 5.h),
                    const Text("Password",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white),
                        child: TextFormField(
                          controller:
                              SignUpBloc.get(context).rePasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please re-enter your password";
                            } else if (value !=
                                SignUpBloc.get(context)
                                    .passwordController
                                    .text) {
                              return 'passwords does not match';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Re-enter your password'),
                          obscureText: true,
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 30.h),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SignUpBloc.get(context).add(RegisterEvent());
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.h.w),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppColors.blueColor),
                            ),
                          )),
                    ),
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
