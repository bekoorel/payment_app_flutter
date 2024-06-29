import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/features/cart/screen/cart_screen.dart';
import 'package:payment_app_flutter/features/login/screen/register_screen.dart';
import 'package:payment_app_flutter/features/payment/screen/payment_screen.dart';
import 'package:payment_app_flutter/features/store/screen/store.dart';

class AppRouter {
  static List<RouteBase> routeList = [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
    GoRoute(
      path: '/Store',
      builder: (BuildContext context, GoRouterState state) {
        return const Store();
      },
    ),
    GoRoute(
      path: '/CartScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const CartScreen();
      },
    ),
    GoRoute(
      path: '/PaymentScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const PaymentScreen();
      },
    ),
  ];
}
