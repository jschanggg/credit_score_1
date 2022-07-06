import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/cs_homepage/SettingsPage/app_review_page.dart';
import 'package:credit_score_1/cs_homepage/SettingsPage/app_permission_page.dart';
import 'package:credit_score_1/cs_homepage/profile_edit_page.dart';
import 'package:credit_score_1/icon_widget.dart';
import 'package:credit_score_1/user.dart';
import 'package:credit_score_1/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final userID = user.email;
    final DateTime now = new DateTime.now();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5c6bc0),
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 20,
                    left: 8,
                  ),
                  child: Column(
                    children: [
                      // FutureBuilder<DocumentSnapshot>(
                      //   future: FirebaseFirestore.instance
                      //       .collection('users')
                      //       .doc(userID)
                      //       .get(),
                      //   builder: (context,
                      //       AsyncSnapshot<DocumentSnapshot> snapshot) {
                      //     if (snapshot.hasError)
                      //       return Center(
                      //         child: Text(snapshot.hasError.toString()),
                      //       );
                      //     return snapshot.hasData
                      //         ? ClipRRect(
                      //             borderRadius: const BorderRadius.vertical(
                      //               top: const Radius.circular(45),
                      //               bottom: const Radius.circular(45),
                      //             ),
                      //             child: Container(
                      //               height: 150,
                      //               color: Colors.white,
                      //               padding: const EdgeInsets.only(
                      //                   top: 10,
                      //                   left: 8,
                      //                   right: 16,
                      //                   bottom: 10),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: <Widget>[
                      //                   ListTile(
                      //                       title: Text(
                      //                         "${DateFormat("EEEE").format(now)}, ${DateFormat("d MMMM").format(now)}",
                      //                         style: TextStyle(
                      //                           fontWeight: FontWeight.w400,
                      //                           fontSize: 20,
                      //                         ),
                      //                       ),
                      //                       subtitle: Text(
                      //                         "Hello, ${snapshot.data!['full name'] ?? ''}",
                      //                         style: TextStyle(
                      //                           fontWeight: FontWeight.w800,
                      //                           fontSize: 30,
                      //                           color: Colors.black,
                      //                         ),
                      //                       )),
                      //                 ],
                      //               ),
                      //             ),
                      //           )
                      //         : Container();
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // Text(
                      //   'Sign In as',
                      //   style: TextStyle(fontSize: 16),
                      // ),
                      // SizedBox(height: 8),
                      // Text(
                      //   user.email!,
                      //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(height: 40),
                      // ElevatedButton.icon(
                      //   style: ElevatedButton.styleFrom(
                      //     minimumSize: Size.fromHeight(50),
                      //   ),
                      //   icon: Icon(Icons.arrow_back, size: 32),
                      //   label: Text(
                      //     'Sign Out',
                      //     style: TextStyle(fontSize: 24),
                      //   ),
                      //   onPressed: () => FirebaseAuth.instance.signOut(),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 8),
                child: GestureDetector(
                  //onTap: () => FirebaseAuth.instance.signOut(),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileEdit()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        //color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: IconWidget(
                          icon: Icons.person, color: (Color(0xFF6f79a8))),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text(
                        'Profile',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 8),
                child: GestureDetector(
                  //onTap: () => FirebaseAuth.instance.signOut(),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PermissionsPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        //color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: IconWidget(
                          icon: Icons.privacy_tip, color: Color(0xFF6f79a8)),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text(
                        'App Permissions',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 8),
                child: GestureDetector(
                  //onTap: () => FirebaseAuth.instance.signOut(),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppReviewPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        //color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: IconWidget(
                          icon: Icons.reviews, color: Color(0xFF6f79a8)),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text(
                        'App Review & Bugs Report',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 8),
                child: GestureDetector(
                  onTap: () => FirebaseAuth.instance.signOut(),
                  child: Container(
                    decoration: BoxDecoration(
                        //color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: IconWidget(
                          icon: Icons.logout_outlined,
                          color: Color(0xFF6f79a8)),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text(
                        'Logout',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  List<Userss> _userDetails = [];

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? users = FirebaseAuth.instance.currentUser;

    final response = await http.get(Uri.encodeFull(url));
    final responseJson = json.decode(response.body);

    // writing all the values
    for (Map<String, dynamic> user in responseJson) {
      _userDetails.add(Userss.fromJson(user));
      await firebaseFirestore.collection("users").doc(users.email).set(user);

      // });
    }

    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}
