import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_score_1/cs_signup/terms_condition_page.dart';
import 'package:credit_score_1/main.dart';
import 'package:credit_score_1/theme.dart';
import 'package:credit_score_1/user_model.dart';
import 'package:credit_score_1/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final bankAccountNoController = TextEditingController();
  //final educationLvlController = TextEditingController();
  // final incomeController = TextEditingController();
  // final depositMonthController = TextEditingController();
  // final insuranceMonthController = TextEditingController();
  // final crdtTransactionController = TextEditingController();
  // final numDtController = TextEditingController();


  // final abilityUtilityController = TextEditingController();
  // final waterBillsController = TextEditingController();
  // final elecBillsController = TextEditingController();
  // final wifiBillsController = TextEditingController();
  // final cabletvBillsController = TextEditingController();
  // final gasBillController = TextEditingController();

  // final abilityDebtController = TextEditingController();
  // final carloansController = TextEditingController();
  // final houseloanntroller = TextEditingController();
  // final studentloanController = TextEditingController();
  // final outstandingBillsController = TextEditingController();
  // final rentalController = TextEditingController();
  // final crCardLoanController = TextEditingController();
  // final mortgagesController = TextEditingController();

  // final abilityMobileController = TextEditingController();
  // final negativeSmController = TextEditingController();
  // final dataUsageController = TextEditingController();
  // final subscriptionController = TextEditingController();
  // final topupontroller = TextEditingController();
  // final ewalletController = TextEditingController();
  // final positiveSmController = TextEditingController();
  // final smsController = TextEditingController();
  // final emailReceivedController = TextEditingController();
  // final callBehaviorController = TextEditingController();
  // final mobileGamesController = TextEditingController();
  // final geolocationController = TextEditingController();

  // final abiltyShoppingController = TextEditingController();
  // final ecoTransController = TextEditingController();
  // final ecoPurchaseController = TextEditingController();
  // final fdPlatformController = TextEditingController();


  final bankNameController = [
    'Public Bank',
    'Maybank Berhad',
    'Ambank Berhad',
    'CIMB'
  ];
  // final raceController = ['Malay', 'Chinese', 'Indian'];
  // final religionController = ['Islam', 'Buddha', 'Hindu', 'Christian'];
  // final marriedController = ['Yes', 'No'];
  // final employedController = ['Yes', 'No'];

  String? value;

  /*String? selectedValue;
  List<String> bankName = [
    'Public Bank',
    'Maybank Berhad',
    'Ambank Berhad',
  ];*/

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    bankAccountNoController.dispose();
    //educationLvlController.dispose();
    //bankNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Sign Up"),
      ),
      body: body(),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );

  Widget body() {
    return SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Image.asset(
                  'assets/images/signuplogo.png',
                  height: 200,
                  width: 200,
                ),
              ),
              //SizedBox(height: 60),
              SizedBox(height: 10),
              Text(
                "Register Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Complete your details",
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),
              TextFormField(
                controller: fullNameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Full Name', hintText: 'Enter your full name'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Email', hintText: 'Enter your email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Password', hintText: 'Enter your password'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Enter min.6 characters'
                    : null,
                obscureText: true,
              ),

              SizedBox(height: 20),
              Container(
                //margin: EdgeInsets.only(left:0),
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    isExpanded: true,
                    hint: const Text(
                      'Select Your Bank',
                      style: TextStyle(fontSize: 14),
                    ),
                    items: bankNameController.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: bankAccountNoController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Bank Account',
                    hintText: 'Enter your bank account'),
              ),

              SizedBox(height: 20),
              TextFormField(
                //controller: educationLvlController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Education Level',
                    hintText: 'Enter your Education Level'),
              ),

              // SizedBox(height: 20),
              // Container(
              //   //margin: EdgeInsets.only(left:0),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 50,
              //     vertical: 6,
              //   ),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     border: Border.all(color: Colors.black, width: 1),
              //   ),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton<String>(
              //       value: value,
              //       iconSize: 36,
              //       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              //       isExpanded: true,
              //       hint: const Text(
              //         'Select Your Race',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       items: bankNameController.map(buildMenuItem).toList(),
              //       onChanged: (value) => setState(() => this.value = value),
              //     ),
              //   ),
              // ),

              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/auth", (route) => false);
                            },
                            icon: Icon(Icons.arrow_back, color: Colors.black),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: (Color(0xFF5c6bc0)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: Size.fromHeight(50),
                          ),
                          icon: Icon(Icons.arrow_forward, size: 24),
                          label: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          onPressed: signUp,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Log In',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: (Color(0xFF26418f))),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 40),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: Checkbox(
              //     value: isChecked,
              //     onChanged: (value) {
              //       setState(() => isChecked = value!);
              //     },
              //   ),
              // ),

              // SizedBox(height: 40),
              // RichText(
              //     text: TextSpan(
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 14,
              //       ),
              //       text: 'By continuing your confirm that you agree with our ',
              //       children: [
              //         TextSpan(
              //           recognizer: TapGestureRecognizer()
              //             ..onTap = () =>
              //                 Navigator.of(context).push(MaterialPageRoute(
              //                   builder: (context) => TermsConditionPage(),
              //                 )),
              //           text: 'Term and Condition',
              //           style: TextStyle(
              //               decoration: TextDecoration.underline,
              //               color: (Color(0xFF26418f))),
              //         ),
              //       ],
              //     ),
              //     textAlign: TextAlign.center),
            ],
          ),
        ));
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.fullName = fullNameController.text;
    userModel.bankAccount = bankAccountNoController.text;
    //userModel.bankName = bankNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
  }
}
