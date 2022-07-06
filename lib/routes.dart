import 'package:credit_score_1/auth_page.dart';
import 'package:credit_score_1/cs_homepage/SettingsPage/settings_page.dart';
import 'package:credit_score_1/cs_homepage/home_page.dart';
import 'package:credit_score_1/cs_onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
/*
final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName:(context) => OnboardingScreen(),
  AuthPage.routeName:(context) => AuthPage(),
}; */

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = new Map<String, dynamic>();

  switch (setting.name) {
    case '/home':
    return MaterialPageRoute(builder: (context) => Home());
    case '/onboarding':
      return MaterialPageRoute(builder: (context) => OnboardingScreen());
    case '/auth':
      return MaterialPageRoute(builder: (context) => AuthPage());
    case '/profile':
    return MaterialPageRoute(builder: (context) => Homepage());
    
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(),
              ));
  }
}