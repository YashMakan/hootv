import 'package:flutter/material.dart';
// import 'package:hootv/app/features/auth/presentation/pages/login_screen.dart';
// import 'package:hootv/app/features/auth/presentation/pages/otp_screen.dart';
// import 'package:hootv/app/features/discover/presentation/pages/discover_screen.dart';
import 'package:hootv/app/features/main/presentation/pages/main_screen.dart';
import 'package:hootv/app/features/media_info/presentation/pages/media_info_screen.dart';
import 'package:hootv/app/features/splash/presentation/pages/splash_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String splashScreen = 'splash';
  static const String loginScreen = 'login';
  static const String otpScreen = 'otp';
  static const String mainScreen = 'main';
  static const String mediaInfoScreen = 'media-info';
}

class NavigationManager {
  static final Map<String, WidgetBuilder> appRoutes = {
    AppRoutes.initial: (context) => const MainScreen(),
    AppRoutes.splashScreen: (context) => const SplashScreen(),
    // AppRoutes.loginScreen: (context) => const LoginScreen(),
    // AppRoutes.otpScreen: (context) => const OtpScreen(),
    AppRoutes.mainScreen: (context) => const MainScreen(),
    AppRoutes.mediaInfoScreen: (context) => const MediaInfoScreen(),
  };
}
