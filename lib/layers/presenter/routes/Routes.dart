// ignore_for_file: constant_identifier_names, file_names

import 'package:stop_depression/layers/presenter/ui/about/about_page.dart';
import 'package:stop_depression/layers/presenter/ui/ajustes/ajuste.dart';
import 'package:stop_depression/layers/presenter/ui/home/home_page.dart';
import 'package:stop_depression/layers/presenter/ui/login/login_page.dart';
import 'package:stop_depression/layers/presenter/ui/register_mood/register_mood_page.dart';
import 'package:stop_depression/layers/presenter/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_desc_1.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_desc_2.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_page.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/desafio.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/therapy_page.dart';
import 'package:stop_depression/layers/presenter/ui/user/user_view.dart';

//import '../../../main.dart';

abstract class Routes {
  static const SPLASH = "/splash";
  static const HOME = "/home";
  static const LOGIN = "/login";
  static const ABOUT = "/about";
  static const THERAPY = '/therapy';
  static const TEST = "/test";
  static const TEST_DESC_1 = "/test_desc_1";
  static const TEST_DESC_2 = "/test_desc_2";
  static const REGISTER_MOOD = "/register_mood";
  static const DESAFIO = "/desafio";
  static const SETTINGS = "/settings";
  static const PERFIL = "/perfil";
  // Routers for Worker

  static Map<String, Widget Function(BuildContext)> routes(
      BuildContext context) {
    return {
      SPLASH: (context) => const SplashPage(),
      HOME: (context) => const HomePage(),
      LOGIN: (context) => const LoginPage(),
      ABOUT: (context) => const AboutPage(),
      THERAPY: (context) => const TherapyPage(),
      TEST: (context) => const TestPage(),
      TEST_DESC_1: (context) => const TestDesc1Page(),
      TEST_DESC_2: (context) => const TestDesc2Page(),
      REGISTER_MOOD: (context) => RegisterMood(),
      DESAFIO: (context) => OrganizarODia(),
      SETTINGS: (context) => const SettingsScreen(),
      PERFIL: (context) => PerfilPage()
    };
  }
}
