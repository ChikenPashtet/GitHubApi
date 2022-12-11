import 'package:flutter/material.dart';
import 'package:test_app/features/auth/sign_in_screen.dart';
import 'package:test_app/features/home/home.dart';
import 'package:test_app/features/onboarding/onboarding_screen.dart';

import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  /// Add entry for new route here
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
            name: settings.name,
          ),
          builder: (_) => Home(
            login: args as String,
          ),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
            name: settings.name,
          ),
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.signIn:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
            name: settings.name,
          ),
          builder: (_) => const SingInScreen(),
        );

      // Default case, should not reach here.
      default:
        return null;
    }
  }
}
