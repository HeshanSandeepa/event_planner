import 'package:flutter/material.dart';
import 'package:event_planner/src/shared/presentation/home_page.dart';
import 'package:event_planner/src/features/auth/presentation/info_page.dart';
import 'package:event_planner/src/features/auth/presentation/login_page.dart';
import 'package:event_planner/src/features/auth/presentation/profile_page.dart';
import 'package:event_planner/src/features/auth/presentation/sign_up_page.dart';
import 'package:event_planner/src/features/auth/presentation/welcome_page.dart';

import '../../features/events/presentation/post_page.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const HomePage(),
        );

      case '/info':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const InfoPage(),
        );

      case '/login':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const LoginPage(),
        );

      case '/sign_up':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const SignUpPage(),
        );

      case '/profile':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const ProfilePage(),
        );

      case '/welcome':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const WelcomePage(),
        );

      case '/post':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            Map<String, dynamic>? args =
                settings.arguments as Map<String, dynamic>?;
            assert(args != null, "posts can not be null");
            return PostPage(posts: args!['posts']);
          },
        );

      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
