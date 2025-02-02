import 'package:ecommerce/core/routing/route_helpers.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/features/Auth/login/ui/screens/forgot_password_screen.dart';
import 'package:ecommerce/features/Auth/login/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
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
      default:
        return null;
    }
  }
}
