import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/cs_homepage/calendar_page.dart';
import 'package:credit_score_1/cs_homepage/pdf_api.dart';
import 'package:credit_score_1/cs_homepage/tips_model.dart';
import 'package:credit_score_1/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'tips_model.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';

class TextPointerPage extends StatefulWidget {
  @override
  _TextPointerPageState createState() => _TextPointerPageState();
}

class _TextPointerPageState extends State<TextPointerPage> {
  int activeDay = 3;
  final DateTime now = new DateTime.now();
  bool closeTopContainer = false;
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "Homepage",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    CollectionReference posts = FirebaseFirestore.instance.collection('users');
    final user = FirebaseAuth.instance.currentUser!;
    final CategoriesScroller categoriesScroller = CategoriesScroller();
    var y1, y2, y3, y4, y5;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 10,
                left: 10,
              ),
              child: Column(
                children: [
                  FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.email)
                          .get(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Center(
                            child: Text('Pending'),
                          );
                        if (snapshot.hasData) {
                          return Text(
                            "Hello, ${snapshot.data!['FullName'] ?? ''}",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          );
                        } else {
                          return Container();
                        }
                      }),
                  SizedBox(
                    height: 17,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.email)
                          .get(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Center(
                            child: Text('Pending'),
                          );
                        if (snapshot.hasData) {
                          y1 = 70.2657 +
                              0.0058 * snapshot.data!['IncomePerMonth'] -
                              2.1553 * snapshot.data!['Deposits'] -
                              3.1449 * snapshot.data!['Insurance'] -
                              1.3840 *
                                  snapshot
                                      .data!['CreditDebitCardsTransaction'] -
                              3.3681 * snapshot.data!['NumDebitCards'];
                          y2 = 56.0311 +
                              0.0036 * snapshot.data!['IncomePerMonth'] -
                              9.0094 * snapshot.data!['WaterBill'] -
                              9.1627 * snapshot.data!['ElectricityBill'] +
                              3.6289 * snapshot.data!['Wi-Fi_Bills'] -
                              3.4194 *
                                  snapshot.data!['MobilePhoneBillPayments'];
                          y3 = 45.5813 +
                              0.0036 * snapshot.data!['IncomePerMonth'] -
                              12.2428 * snapshot.data!['CarLoan'] +
                              6.8032 * snapshot.data!['HouseLoan'] +
                              9.5314 * snapshot.data!['StudentLoan'] +
                              5.8109 * snapshot.data!['OutstandingBills'] +
                              4.2801 * snapshot.data!['Rental'];
                          y4 = 43.1315 +
                              0.0054 * snapshot.data!['IncomePerMonth'] -
                              3.2592 *
                                  snapshot
                                      .data!['SocialMediaPlatforms(negative)'] -
                              4.5039 * snapshot.data!['DataUsage'] -
                              3.2918 * snapshot.data!['SubscriptionFees'] +
                              2.2952 * snapshot.data!['Top-upHistory'] +
                              3.4418 * snapshot.data!['E-Wallet'] +
                              1.1119 *
                                  snapshot
                                      .data!['SocialMediaPlatforms(positive)'];
                          y5 = 43.8939 +
                              0.0031 * snapshot.data!['IncomePerMonth'] +
                              2.7182 * snapshot.data!['EcommerceTransaction'] +
                              2.2731 * snapshot.data!['EcommerceBuyingHabits'] +
                              2.5934 * snapshot.data!['FoodDeliveryPlatforms'];
                          final y = y1 + y2 + y3 + y4 + y5;
                          return SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                  showLabels: false,
                                  showAxisLine: false,
                                  showTicks: false,
                                  minimum: 0,
                                  maximum: 999,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                        startValue: 0,
                                        endValue: 560,
                                        color: Color(0xFFFF4d4d),
                                        sizeUnit: GaugeSizeUnit.factor,
                                        startWidth: 0.45,
                                        endWidth: 0.45),
                                    GaugeRange(
                                      startValue: 561,
                                      endValue: 720,
                                      color: Color(0xFFFFb84d),
                                      labelStyle: GaugeTextStyle(fontSize: 20),
                                      startWidth: 0.45,
                                      endWidth: 0.45,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 721,
                                      endValue: 880,
                                      color: Color(0xFFffff4d),
                                      labelStyle: GaugeTextStyle(fontSize: 20),
                                      startWidth: 0.45,
                                      endWidth: 0.45,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 881,
                                      endValue: 960,
                                      color: Color(0xFF00cc44),
                                      labelStyle: GaugeTextStyle(fontSize: 20),
                                      startWidth: 0.45,
                                      endWidth: 0.45,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 961,
                                      endValue: 999,
                                      color: Color(0xFF008040),
                                      labelStyle: GaugeTextStyle(fontSize: 20),
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: 0.45,
                                      endWidth: 0.45,
                                    ),
                                  ],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(value: y)
                                  ])
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                  FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.email)
                          .get(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Center(
                            child: Text('Pending'),
                          );
                        if (snapshot.hasData) {
                          y1 = 70.2657 +
                              0.0058 * snapshot.data!['IncomePerMonth'] -
                              2.1553 * snapshot.data!['Deposits'] -
                              3.1449 * snapshot.data!['Insurance'] -
                              1.3840 *
                                  snapshot
                                      .data!['CreditDebitCardsTransaction'] -
                              3.3681 * snapshot.data!['NumDebitCards'];
                          y2 = 56.0311 +
                              0.0036 * snapshot.data!['IncomePerMonth'] -
                              9.0094 * snapshot.data!['WaterBill'] -
                              9.1627 * snapshot.data!['ElectricityBill'] +
                              3.6289 * snapshot.data!['Wi-Fi_Bills'] -
                              3.4194 *
                                  snapshot.data!['MobilePhoneBillPayments'];
                          y3 = 45.5813 +
                              0.0036 * snapshot.data!['IncomePerMonth'] -
                              12.2428 * snapshot.data!['CarLoan'] +
                              6.8032 * snapshot.data!['HouseLoan'] +
                              9.5314 * snapshot.data!['StudentLoan'] +
                              5.8109 * snapshot.data!['OutstandingBills'] +
                              4.2801 * snapshot.data!['Rental'];
                          y4 = 43.1315 +
                              0.0054 * snapshot.data!['IncomePerMonth'] -
                              3.2592 *
                                  snapshot
                                      .data!['SocialMediaPlatforms(negative)'] -
                              4.5039 * snapshot.data!['DataUsage'] -
                              3.2918 * snapshot.data!['SubscriptionFees'] +
                              2.2952 * snapshot.data!['Top-upHistory'] +
                              3.4418 * snapshot.data!['E-Wallet'] +
                              1.1119 *
                                  snapshot
                                      .data!['SocialMediaPlatforms(positive)'];
                          y5 = 43.8939 +
                              0.0031 * snapshot.data!['IncomePerMonth'] +
                              2.7182 * snapshot.data!['EcommerceTransaction'] +
                              2.2731 * snapshot.data!['EcommerceBuyingHabits'] +
                              2.5934 * snapshot.data!['FoodDeliveryPlatforms'];
                          final double y = y1 + y2 + y3 + y4 + y5;
                          if (y > 0 || y < 561) {
                            return Text(
                              '${y.toStringAsFixed(2)}\nYour Credit Score is Poor',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            );
                          } else if (y > 560 || y < 721) {
                            return Text('Fair');
                          } else if (y > 720 || y < 881) {
                            return Text('Good');
                          } else if (y > 880 || y < 961) {
                            return Text('Very Good');
                          } else if (y > 960 || y < 999) {
                            return Text('Excellent');
                          }
                          return Text(
                            "$y.toStringAsFixed($y);",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            ("Updated, ${DateFormat("EEEE").format(now)}, ${DateFormat("d MMMM").format(now)}"),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 23, bottom: 0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/color1.png',
                        height: 30,
                        width: 30,
                      ),
                      Text('Poor'),
                      Text('0-560'),
                    ],
                  ),
                  SizedBox(width: 26), // give it width
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/color2.png',
                        height: 30,
                        width: 30,
                      ),
                      Text('Fair'),
                      Text('561-720'),
                    ],
                  ),
                  SizedBox(width: 24), // give it width
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/color3.png',
                        height: 30,
                        width: 30,
                      ),
                      Text('Good'),
                      Text('721-880'),
                    ],
                  ),
                  SizedBox(width: 26), // give it width
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/color4.png',
                        height: 30,
                        width: 30,
                      ),
                      Text('VeryGood'),
                      Text('881-960'),
                    ],
                  ),
                  SizedBox(width: 24),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/color5.png',
                        height: 30,
                        width: 30,
                      ),
                      Text('Excellent'),
                      Text('961-999'),
                    ],
                  ), // give it width
                ],
              ),
            ),
          ),
          Divider(
            indent: 16,
            thickness: 1.4,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tips to Improve Credit Score',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : categoryHeight,
                child: categoriesScroller),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.email)
                  .get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text('Pending'),
                  );
                if (snapshot.hasData) {
                  y1 = 70.2657 +
                      0.0058 * snapshot.data!['IncomePerMonth'] -
                      2.1553 * snapshot.data!['Deposits'] -
                      3.1449 * snapshot.data!['Insurance'] -
                      1.3840 * snapshot.data!['CreditDebitCardsTransaction'] -
                      3.3681 * snapshot.data!['NumDebitCards'];
                  y2 = 56.0311 +
                      0.0036 * snapshot.data!['IncomePerMonth'] -
                      9.0094 * snapshot.data!['WaterBill'] -
                      9.1627 * snapshot.data!['ElectricityBill'] +
                      3.6289 * snapshot.data!['Wi-Fi_Bills'] -
                      3.4194 * snapshot.data!['MobilePhoneBillPayments'];
                  y3 = 45.5813 +
                      0.0036 * snapshot.data!['IncomePerMonth'] -
                      12.2428 * snapshot.data!['CarLoan'] +
                      6.8032 * snapshot.data!['HouseLoan'] +
                      9.5314 * snapshot.data!['StudentLoan'] +
                      5.8109 * snapshot.data!['OutstandingBills'] +
                      4.2801 * snapshot.data!['Rental'];
                  y4 = 43.1315 +
                      0.0054 * snapshot.data!['IncomePerMonth'] -
                      3.2592 *
                          snapshot.data!['SocialMediaPlatforms(negative)'] -
                      4.5039 * snapshot.data!['DataUsage'] -
                      3.2918 * snapshot.data!['SubscriptionFees'] +
                      2.2952 * snapshot.data!['Top-upHistory'] +
                      3.4418 * snapshot.data!['E-Wallet'] +
                      1.1119 * snapshot.data!['SocialMediaPlatforms(positive)'];
                  y5 = 43.8939 +
                      0.0031 * snapshot.data!['IncomePerMonth'] +
                      2.7182 * snapshot.data!['EcommerceTransaction'] +
                      2.2731 * snapshot.data!['EcommerceBuyingHabits'] +
                      2.5934 * snapshot.data!['FoodDeliveryPlatforms'];
                  final double y = y1 + y2 + y3 + y4 + y5;
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: (Color(0xFF283593)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          minimumSize: Size.fromHeight(50),
                        ),
                        //icon: Icon(Icons.arrow_forward, size: 10),
                        child: Text(
                          'Download Credit Score Report',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () async {
                          final pdfFile = await PdfApi.generateCenteredText(
                              y, snapshot.data!['FullName'],snapshot.data!['DOB'],snapshot.data!['Occupation'],snapshot.data!['HighestLevelEducation'],snapshot.data!['Bank'],snapshot.data!['BankAccount'],y1,y2,y3,y4,y5);

                          PdfApi.openFile(pdfFile);
                        }),
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
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

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.50 - 20;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Column(children: <Widget>[
            Container(
              width: 380,
              margin: EdgeInsets.only(right: 10, left: 10),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: Color(0xFFb39ddb),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Verify that all the information is accurate",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 16,
                      thickness: 1.4,
                    ),
                    Text(
                      "Always make sure they have your correct and updated information so that your latest credit reports will be as accurate as possible.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 380,
              margin: EdgeInsets.only(right: 10, left: 10),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: Color(0xFF836fa9),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Set Up Payment Reminders",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        indent: 16,
                        thickness: 1.4,
                      ),
                      Text(
                        "Set up online reminders and write down payment deadlines for each bill in a planner or calendar. Paying your bills on time on a routine basis can improve your credit score within a few months.",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 380,
              margin: EdgeInsets.only(right: 10, left: 10),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: Color(0xFFb39ddb),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Pay More Than Once in a Billing Cycle",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 16,
                      thickness: 1.4,
                    ),
                    Text(
                      "If you can afford it, pay down your bills every two weeks rather than once a month. This lowers your credit utilization and improves your score.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 380,
              margin: EdgeInsets.only(right: 10, left: 10),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: Color(0xFF836fa9),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Apply for New Credit Sparingly",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 16,
                      thickness: 1.4,
                    ),
                    Text(
                      "Although it increases your total credit limit, it hurts your score if you apply for or open several new accounts in a short time.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 380,
              margin: EdgeInsets.only(right: 10, left: 10),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: Color(0xFFb39ddb),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Be Careful Paying Off Old Debts",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 16,
                      thickness: 1.4,
                    ),
                    Text(
                      "If a debt is “charged off” by the creditor, it means they do not expect further payments. If you make a payment on a charged off account, it reactivates the debt and lowers your credit score.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 380,
              margin: EdgeInsets.only(right: 10, left: 10),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: Color(0xFF836fa9),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Consider a Debt Consolidation Plan",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 16,
                      thickness: 1.4,
                    ),
                    Text(
                      "There could be a temporary drop in your credit score if you enroll in a debt consolidation program, but as long as you make on-time payments, your score quickly improves and you are eliminating the debt that got you in trouble to start with.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 380,
              margin: EdgeInsets.only(right: 10, left: 10),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: Color(0xFFb39ddb),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Pay Down “Maxed Out” Cards First",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 16,
                      thickness: 1.4,
                    ),
                    Text(
                      "If you use multiple credit cards and the amount owed on one or more is close to the credit limit, pay that one off first to bring down your credit utilization rate.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
