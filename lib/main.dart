import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:credit_score_1/auth_page.dart';
import 'package:credit_score_1/cs_homepage/home_page.dart';
import 'package:credit_score_1/cs_login/login_widget.dart';
import 'package:credit_score_1/cs_onboarding/onboarding_screen.dart';
import 'package:credit_score_1/cs_splash_screen/splash_screen.dart';
import 'package:credit_score_1/utils.dart';
import 'package:credit_score_1/cs_verifyEmail/verify_email_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'routes.dart' as router;
import 'theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static final String title = 'Credit score';

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'My Credit Scores',
        theme: theme(),
        home: Splash(),
        //initialRoute: '/onboarding',
        onGenerateRoute: router.generateRoute,
      );
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: 500,
        animationDuration: Duration(seconds: 1),
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/logoooo.png')),
          ],
        ),
        nextScreen: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else if (snapshot.hasData) {
              return Home();
            } else {
              return AuthPage();
            }
          },
        ),
      );
}
