import 'package:auvnet_task/core/utils/routes_manager.dart';
import 'package:auvnet_task/ui/Auth/login/login_view.dart';
import 'package:auvnet_task/ui/Auth/signup/signup_view.dart';
import 'package:auvnet_task/ui/main_screen/main_screen.dart';
import 'package:auvnet_task/ui/on_boarding_screen/on_boarding_view.dart';
import 'package:auvnet_task/ui/tabs/home/home_tab_view.dart';
import 'package:flutter/material.dart';
import 'config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        RouteManager.onBoardingScreen: (context) => const OnBoardingView(),
        RouteManager.loginScreen: (context) => const LoginView(),
        RouteManager.singupScreen: (context) => const SignupView(),
        RouteManager.mainScreen: (context) => const MainScreen(),
      },
      // initialRoute: RouteManager.mainScreen,
      home: const MainScreen(),
    );
  }
}
