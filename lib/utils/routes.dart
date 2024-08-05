import 'package:batch730pm/bottom_nav_screen.dart';
import 'package:batch730pm/gridview.dart';
import 'package:batch730pm/list.dart';
import 'package:batch730pm/register_screen.dart';
import 'package:batch730pm/travel_screen.dart';
import 'package:batch730pm/user_details.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/login.dart';
import 'package:batch730pm/home_screen.dart';
import 'package:batch730pm/screen2.dart';
import 'package:flutter/material.dart';

class MyAppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyBottomNavScreen());
      case routeScreen2:
        return MaterialPageRoute(builder: (_) => const Screen2());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeRegister:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case routeListScreen:
        return MaterialPageRoute(builder: (_) => const ListScreen());
      case routeGridViewScreen:
        return MaterialPageRoute(builder: (_) => const GridViewScreen());
      case routeTravelScreen:
        return MaterialPageRoute(builder: (_) => const TravelScreen());
      case routeUserDetailsScreen:
        return MaterialPageRoute(builder: (_) => UserDetailsScreen(arguments: settings.arguments));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Route<dynamic> generateNestedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
