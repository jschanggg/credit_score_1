import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_score_1/Forgot_password/forgot_password_page.dart';
import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/user.dart';
import 'package:credit_score_1/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final user = FirebaseAuth.instance.currentUser!;
  final occupationController = TextEditingController();
  final educationController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 13, right: 13),
            child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.email)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(
                        "Name ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${snapshot.data!['FullName'] ?? ''}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, left: 13, right: 13),
            child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.email)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(
                        "Date of Birth",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${snapshot.data!['DOB'] ?? ''}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, left: 13, right: 13),
            child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.email)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(
                        "Phone Number ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${snapshot.data!['PhoneNo'] ?? ''}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: editPhoneDialog, icon: Icon(Icons.edit)),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, left: 13, right: 13),
            child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.email)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(
                        "Occupation ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${snapshot.data!['Occupation'] ?? ''}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: editOccupationDialog,
                          icon: Icon(Icons.edit)),
                    );
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Occupation: ",
                    //       style: TextStyle(
                    //           fontSize: 22, fontWeight: FontWeight.bold),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     SizedBox(
                    //       width: 150,
                    //     ),
                    //     Text(
                    //       "${snapshot.data!['Occupation'] ?? ''}",
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ],
                    // );
                  } else {
                    return Container();
                  }
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, left: 13, right: 13),
            child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.email)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(
                        "Education Level ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${snapshot.data!['HighestLevelEducation'] ?? ''}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: editEduLvlDialog, icon: Icon(Icons.edit)),
                    );
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Occupation: ",
                    //       style: TextStyle(
                    //           fontSize: 22, fontWeight: FontWeight.bold),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     SizedBox(
                    //       width: 150,
                    //     ),
                    //     Text(
                    //       "${snapshot.data!['Occupation'] ?? ''}",
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ],
                    // );
                  } else {
                    return Container();
                  }
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, left: 13, right: 13),
            child: ListTile(
              title: Text(
                "Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                  },
                  icon: Icon(Icons.edit)),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20, left: 13, right: 13),
          //   child: TextFormField(
          //     //cursorColor: Theme.of(context).cursorColor,
          //     //initialValue: 'Edit your phone number',
          //     maxLength: 25,
          //     decoration: InputDecoration(
          //       icon: Icon(Icons.phone_android),
          //       labelText: 'Phone No',
          //       //helperText: 'Helper text',
          //       suffixIcon: Icon(Icons.check_circle),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20, left: 13, right: 13),
          //   child: TextFormField(
          //     //cursorColor: Theme.of(context).cursorColor,
          //     //initialValue: 'Edit your password',
          //     //maxLength: 6,
          //     decoration: InputDecoration(
          //       icon: Icon(Icons.password),
          //       labelText: 'Password',
          //       //helperText: 'Helper text',
          //       suffixIcon: Icon(
          //         Icons.check_circle,
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 80,
          // ),
          // InkWell(
          //   onTap: editDialog,
          //   child: Container(
          //     height: 50,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //         gradient:
          //             LinearGradient(colors: [kSecondaryDarkColor, Colors.grey]),
          //         borderRadius: BorderRadius.circular(30)),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           "Edit",
          //           style: TextStyle(
          //               fontSize: 16, color: white, fontWeight: FontWeight.bold),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }

  Future editPhoneDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Edit new phone number'),
              content: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(hintText: 'Enter new phone number'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: updatePhone,
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ));
  }

  Future editOccupationDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Edit new occupation'),
              content: TextFormField(
                controller: occupationController,
                decoration: InputDecoration(hintText: 'Enter new occupation'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: updateOccupation,
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ));
  }

  Future editEduLvlDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Edit new education level'),
              content: TextFormField(
                controller: educationController,
                decoration:
                    InputDecoration(hintText: 'Enter new education level'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: updateEduLvl,
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ));
  }

  updatePhone() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    await firebaseFirestore
        .collection("users")
        .doc(user.email)
        .update({'PhoneNo': phoneController.text});
    Fluttertoast.showToast(msg: "Changed successfully :) ");
    setState(() {});
    // Navigator.pushNamedAndRemoveUntil(context, "/profile", (route) => false);
  }

  updateOccupation() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    await firebaseFirestore
        .collection("users")
        .doc(user.email)
        .update({'Occupation': occupationController.text});
    Fluttertoast.showToast(msg: "Changed successfully :) ");
    setState(() {});
    // Navigator.pushNamedAndRemoveUntil(context, "/profile", (route) => false);
  }

  updateEduLvl() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    await firebaseFirestore
        .collection("users")
        .doc(user.email)
        .update({'HighestLevelEducation': educationController.text});
    Fluttertoast.showToast(msg: "Changed successfully :) ");
    setState(() {});
    // Navigator.pushNamedAndRemoveUntil(context, "/profile", (route) => false);
  }
}
