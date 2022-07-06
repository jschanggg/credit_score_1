import 'package:credit_score_1/cs_login/login_widget.dart';
import 'package:credit_score_1/cs_signup/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  static String routeName = "/auth";

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginWidget(
        onClickedSignUp: toggle,
      );
    } else {
      return SignUpWidget(onClickedSignIn: toggle);
    }
  }

  void toggle() => setState(() => isLogin = !isLogin);
}
