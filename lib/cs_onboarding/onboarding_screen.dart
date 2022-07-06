import 'package:credit_score_1/cs_onboarding/onboarding_body.dart';
import 'package:credit_score_1/size_config.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}