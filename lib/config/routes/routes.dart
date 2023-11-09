import 'package:ecommerce_c9_monday/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/product_list/presentation/pages/product_details.dart';
import '../../features/product_list/presentation/pages/product_list.dart';
import '../../features/signup/presentation/pages/signup.dart';

class AppRoute {
  static const String logIn = "/";
  static const String signUp = "signup";
  static const String home = "home";
  static const String productList = "productList";
  static const String productDetails = "productDetails";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case AppRoute.logIn:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoute.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoute.productList:
        return MaterialPageRoute(
            builder: (context) => const ProductListScreen());
      case AppRoute.productDetails:
        return MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen(),
            settings: settings);
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
