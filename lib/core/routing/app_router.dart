import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/login/login_screen.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/register/register_screen.dart';
import 'package:flutter_mentorship_b1/features/opening/screens/welcome/welcome_screen.dart';
import 'package:flutter_mentorship_b1/features/profile/ui/profile_screen.dart';
import 'package:flutter_mentorship_b1/features/rockets/logic/all_rockets_cubit.dart';
import 'package:flutter_mentorship_b1/features/rockets/ui/rockets_screen.dart';
import 'package:flutter_mentorship_b1/features/search/ui/search_screen.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/cubit.dart';
import 'package:flutter_mentorship_b1/features/ships/ui/screens/ships_screen.dart';

import '../../features/opening/screens/splash/ui/splash_screen.dart';

import '../../features/home/ui/home_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const Search(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const Profile(),
        );

      case Routes.ships:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ShipCubit>()..getAllShips(),
            child: const ShipsScreen(),
          ),
        );
      case Routes.allRockets:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AllRocketsCubit>()..fetchAllRockets(),
            child: const RocketsScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
