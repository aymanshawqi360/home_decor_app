import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/di/dependency_injection.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/features/forgot_password/presentation/pages/forgot_password_screen.dart';
import 'package:home_decor_app/features/home/presentation/pages/button_navigate_between_screen.dart';
import 'package:home_decor_app/features/home/presentation/pages/home_screen.dart';
import 'package:home_decor_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:home_decor_app/features/login/presentation/pages/login_screen.dart';
import 'package:home_decor_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:home_decor_app/features/search/presentation/pages/search_screen.dart';
import 'package:home_decor_app/features/set_password/presentation/pages/set_password_screen.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/pages/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) {
            return OnboardingScreen();
          },
        );
      case Routes.buttonNavigateBetweenScreen:
        return MaterialPageRoute(builder: (_) => ButtonNavigateBetweenScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => LoginCubit(getIt()),
                child: LoginScreen(),
              ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SignUpCubit(getIt()),
                child: SignUpScreen(),
              ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case Routes.setPassword:
        return MaterialPageRoute(builder: (_) => SetPasswordScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.search:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        SearchCubit(getIt())
                          ..getFilterResult()
                          ..getApiSettings(),

                child: SearchScreen(),
              ),
        );

      default:
        return null;
    }
  }
}
