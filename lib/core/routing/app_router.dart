import 'package:ecommerce/core/routing/route_helpers.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/features/Auth/login/ui/screens/forgot_password_screen.dart';
import 'package:ecommerce/features/Auth/login/ui/screens/login_screen.dart';
import 'package:ecommerce/features/Auth/otp/ui/otp_screen.dart';
import 'package:ecommerce/features/home/ui/screens/categories_screen.dart';
import 'package:ecommerce/features/home/ui/screens/notifications_screen.dart';
import 'package:ecommerce/features/home/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import '../../features/main_navigation_bar/main_navigation_bar.dart';
import '../../features/onBoarding/ui/on_boarding_screen.dart';

class AppRouter {
  Route? generteRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return buildRoute(const OnBoardingScreen());
      case Routes.loginScreen:
        return buildRoute(const LoginScreen());
      case Routes.forgotPasswordScreen:
        return buildRoute(const ForgotPasswordScreen());
      case Routes.otpScreen:
        return buildRoute(const OtpScreen());
      case Routes.mainNavigationBar:
        final int selectedIndex = settings.arguments as int? ?? 0;
        return buildRoute(MainNavigationBar(selectedIndex: selectedIndex));
      case Routes.categoriesScreen:
        return buildRoute(const CategoriesScreen());
      case Routes.notificationsScreen:
        return buildRoute(const NotificationsScreen());
      case Routes.productDetailsScreen:
        return buildRoute(const ProductDetailsScreen());
      default:
        return null;
    }
  }
}
