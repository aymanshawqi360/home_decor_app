import 'package:flutter/material.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) {
            return OnboardingScreen();
          },
        );

      default:
        return null;
    }
  }
}
