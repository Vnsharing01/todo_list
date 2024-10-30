import 'package:flutter/material.dart';


import '../Screens/auth/login/view/login_screen.dart';
import '../Screens/auth/sign_up/view/sign_up_screen.dart';
import '../Screens/edit_todo.dart/views/edit_todo_screen.dart';
import '../Screens/home/view/home_screen.dart';
import '../Screens/todo_detail/view/todo_detail_screen.dart';
import 'routes.dart';

class AppRoute {
  Route onPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.HOME:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: RouteSettings(
            name: Routes.HOME,
            arguments: routeSettings.arguments,
          ),
        );
      case Routes.SIGN_UP:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: RouteSettings(
            name: Routes.SIGN_UP,
            arguments: routeSettings.arguments,
          ),
        );
      case Routes.LOGIN:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: RouteSettings(
            name: Routes.LOGIN,
            arguments: routeSettings.arguments,
          ),
        );
      case Routes.DETAIL:
        return MaterialPageRoute(
          builder: (context) => const TodoDetailScreen(),
          settings: RouteSettings(
            name: Routes.DETAIL,
            arguments: routeSettings.arguments,
          ),
        );
      case Routes.EDIT_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const EditTodoScreen(),
          settings: RouteSettings(
            name: Routes.EDIT_SCREEN,
            arguments: routeSettings.arguments,
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Something Error'),
        ),
      );
    });
  }
}
