import 'package:credit_score_1/Forgot_password/forgot_password_page.dart';
import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "Login",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: personal(),
    );
  }

  Widget personal() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Image.asset(
              'assets/images/logoooo.png',
              height: 250,
              width: 250,
            ),
          ),

          Text(
            "Welcome Back",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sign in with your email and password",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          TextField(
            controller: emailController,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                primary: Colors.white,
                backgroundColor: kPrimaryColor,
              ),
              icon: Icon(Icons.lock_open, size: 24),
              label: Text(
                'Sign In',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: signIn,
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            child: Text(
              'Forget Password',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: (Color(0xFF26418f)),
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ForgotPasswordPage(),
            )),
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  text: 'No Account? ',
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: (Color(0xFF26418f))))
              ]))
        ],
      ),
    );
  }


  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    //Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
