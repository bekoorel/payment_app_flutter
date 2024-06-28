import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/core/router/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter(routes: AppRouter.routeList);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,

      // theme: AppTheme.darkTheme, // استخدم الثيم الفاتح
      // darkTheme: AppTheme.darkTheme, // استخدم الثيم الداكن
      // themeMode: ThemeMode.system,  // يتغير الثيم حسب إعدادات النظام
    );
  }
}
