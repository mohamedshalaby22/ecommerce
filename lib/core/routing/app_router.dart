import 'package:ecommerce/core/routing/route_helpers.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../features/onBoarding/ui/on_boarding_screen.dart';

class AppRouter {
  Route? generteRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return buildRoute(const OnBoardingScreen());
      default:
        return null;
    }
  }
}
