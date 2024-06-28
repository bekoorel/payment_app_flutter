import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/features/login/register_screen.dart';

class AppRouter {
 static List<RouteBase> routeList = [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
  ];
}
