import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/register/register_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/login/login_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/login/login_screen.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/register/register_screen.dart';
import 'package:flutter_mentorship_b1/features/developers_team/ui/developers_team_screen.dart';
import 'package:flutter_mentorship_b1/features/dragons/data/models/dragon_model.dart';
import 'package:flutter_mentorship_b1/features/launches/logic/launches_cubit.dart';
import 'package:flutter_mentorship_b1/features/launches/ui/launches_screen.dart';
import 'package:flutter_mentorship_b1/features/opening/screens/welcome/welcome_screen.dart';
import 'package:flutter_mentorship_b1/features/profile/ui/profile_screen.dart';
import 'package:flutter_mentorship_b1/features/rockets/logic/all_rockets_cubit.dart';
import 'package:flutter_mentorship_b1/features/rockets/ui/rockets_screen.dart';
import 'package:flutter_mentorship_b1/features/search/ui/search_screen.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/cubit.dart';
import 'package:flutter_mentorship_b1/features/ships/ui/screens/ships/ships_screen.dart';

import '../../features/about_company/logic/company_cubit.dart';
import '../../features/about_company/ui/about_company_screen.dart';
import '../../features/dragons/logic/dragon_cubit.dart';
import '../../features/dragons/ui/dragons_details.dart';
import '../../features/dragons/ui/dragons_screen.dart';
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
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
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
            create: (_) => getIt<AllRocketsCubit>()..fetchAllRockets(),
            child: const RocketsScreen(),
          ),
        );
      case Routes.aboutCompany:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<CompanyCubit>()..getAboutCompany(),
            child: const AboutCompanyScreen(),
          ),
        );
      case Routes.developersTeam:
        return MaterialPageRoute(
          builder: (_) => const DevelopersTeamScreen(),
        );
      case Routes.dragons:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<DragonCubit>()..getDragons(),
            child: const DragonsScreen(),
          ),
        );
      case Routes.dragonsDetails:
        final Dragon dragon = settings.arguments as Dragon;
        return MaterialPageRoute(
          builder: (_) => DragonsDetails(
            dragon: dragon,
          ),
        );
      case Routes.launches:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LaunchesCubit>()..getLaunches(),
            child: const LaunchesScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
