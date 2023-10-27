import 'package:ecommerce_c9_monday/features/abdelhady.dart';
import 'package:ecommerce_c9_monday/features/login/presentation/pages/login_screen.dart';
import 'package:ecommerce_c9_monday/features/signup/presentation/pages/signup.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String login = "login";
  static const String signup = "/";
  static const String home = "Home";
  static const String productList = "ProductLisScreen";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case AppRoute.signup:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case AppRoute.productList:
        return MaterialPageRoute(
          builder: (context) => const ProductListScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("UnDefine"),
            ),
            body: unDefineRoute(),
          ),
        );
    }
  }

  static Widget unDefineRoute() {
    return const Center(
      child: Text("Route Not Fount"),
    );
  }
}
