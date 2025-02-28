// ignore_for_file: constant_identifier_names, file_names

import 'package:stop_depression/layers/presenter/ui/about/about_page.dart';
import 'package:stop_depression/layers/presenter/ui/home/home_page.dart';
import 'package:stop_depression/layers/presenter/ui/login/login_page.dart';
import 'package:stop_depression/layers/presenter/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/therapy_page.dart';

//import '../../../main.dart';

abstract class Routes {
  static const SPLASH = "/splash";
  static const HOME = "/home";
  static const LOGIN = "/login";
  static const ABOUT = "/about";
  static const THERAPY = '/therapy';

  // Routers for Worker

  static Map<String, Widget Function(BuildContext)> routes(
      BuildContext context) {
    return {
      SPLASH: (context) => const SplashPage(),
      HOME: (context) => HomePage(),
      LOGIN: (context) => LoginPage(),
      ABOUT: (context) => const AboutPage(),
      THERAPY: (context) => TherapyPage()
    };
  }
}
