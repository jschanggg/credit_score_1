// import 'package:credit_score_1/cs_onboarding/onboarding_screen.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   static var routeName;

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     var d = Duration(seconds: 3);
//     //delayed 3 seconds to next page
//     Future.delayed(d,() {
//       // to next page and close this page
//       Navigator.pushAndRemoveUntil(
//         context,
//          MaterialPageRoute(
//            builder: (context) {
//            return ();
//          },
//         ),
//         (route) => false,
//       );  
//     });

//     super.initState();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [
//             //Color(0xFF303F9F),
//             Color(0xFF3949AB),
//             Color(0xFF3F51B5),
//             Color(0xFF5C6BC0),
//             Color(0xFF7986CB),
//             Color(0xFfC5CAE9),
//           ],
//           stops: [
//             0.1,
//             0.4,
//             0.6,
//             0.8,
//             1,
//           ],
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           ),
//         ),
//         child: Center(
//           child: Image( 
//             image: AssetImage('assets/images/logoooo.png'
//             ),
//             width: 90,
//             height: 100,
//           ),
//         ),
//       ),
//     );
//   }
// }