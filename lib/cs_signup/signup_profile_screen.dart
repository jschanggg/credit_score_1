// import 'package:credit_score_1/constants.dart';
// import 'package:credit_score_1/main.dart';
// import 'package:credit_score_1/utils.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class SignUpProfile extends StatefulWidget {
//   final Function() onClickedSignIn;

//   const SignUpProfile({
//     Key? key,
//     required this.onClickedSignIn,
//   }) : super(key: key);

//   @override
//   _SignUpProfileState createState() => _SignUpProfileState();
// }

// class _SignUpProfileState extends State<SignUpProfile> {
//   bool isChecked = false;
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   void dispose() {
//     //emailController.dispose();
//     //passwordController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text("Sign Up"),
//       ),
//       body: body(),
//     );
//   }

//   Widget body() {
//     return SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //SizedBox(height: 60),
//               SizedBox(height: 20),
//               Text("Register Account", style: headingStyle),
//               Text(
//                 "Complete your details",
//                 textAlign: TextAlign.center,
//               ),

//               SizedBox(height: 40),
//               TextFormField(
//                 controller: emailController,
//                 cursorColor: Colors.black,
//                 textInputAction: TextInputAction.next,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (email) =>
//                     email != null && !EmailValidator.validate(email)
//                         ? 'Enter a valid email'
//                         : null,
//               ),

//               SizedBox(height: 4),
//               TextFormField(
//                 controller: passwordController,
//                 textInputAction: TextInputAction.next,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) => value != null && value.length < 6
//                     ? 'Enter min.6 characters'
//                     : null,
//                 obscureText: true,
//               ),

//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Row(
//                     children: [
//                       Expanded(
//                           flex: 1,
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.pushNamedAndRemoveUntil(
//                                   context, "/auth", (route) => false);
//                             },
//                             icon: Icon(Icons.arrow_back, color: Colors.black),
//                           )),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         flex: 3,
//                         child: ElevatedButton.icon(
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             minimumSize: Size.fromHeight(50),
//                           ),
//                           icon: Icon(Icons.arrow_forward, size: 24),
//                           label: Text(
//                             'Sign Up',
//                             style: TextStyle(fontSize: 24),
//                           ),
//                           onPressed: signUp,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               SizedBox(height: 20),
//               RichText(
//                 text: TextSpan(
//                   style: TextStyle(color: Colors.black, fontSize: 20),
//                   text: 'Already have an account? ',
//                   children: [
//                     TextSpan(
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = widget.onClickedSignIn,
//                       text: 'Log In',
//                       style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           color: (Color(0xFF26418f))),
//                     ),
//                   ],
//                 ),
//               ),

//             ],
//           ),
//         ));
//   }

//   Future signUp() async {
//     final isValid = formKey.currentState!.validate();
//     if (!isValid) return;

//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => Center(child: CircularProgressIndicator()),
//     );

//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e);

//       Utils.showSnackBar(e.message);
//     }

//     navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }
// }
