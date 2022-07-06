import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/cs_homepage/calendar_page.dart';
import 'package:credit_score_1/cs_homepage/chart.dart';
import 'package:credit_score_1/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  int activeDay = 3;

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "Statistics",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    var y1, y2, y3, y4, y5;
    final user = FirebaseAuth.instance.currentUser!;

    List<Color> colorList = [
      const Color(0xffd966ff),
      const Color(0xff66ff8c),
      const Color(0xff66b3ff),
      const Color(0xffff6666),
      const Color(0xffffb366)
    ];
    return ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
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
                          child: Text(snapshot.hasError.toString()),
                        );
                      if (snapshot.hasData) {
                        y1 = 70.2657 +
                            0.0058 * snapshot.data!['IncomePerMonth'] -
                            2.1553 * snapshot.data!['Deposits'] -
                            3.1449 * snapshot.data!['Insurance'] -
                            1.3840 *
                                snapshot.data!['CreditDebitCardsTransaction'] -
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
                        Map<String, double> dataMap = {
                          "Traditional Bank %": y1, 
                          "Utilities %": y2,
                          "Debt %": y3,
                          "Mobile %": y4,
                          "Shopping %": y5,
                        };
                        if (y > 0 || y < 561) {
                          return PieChart(
                            dataMap: dataMap,
                            colorList: colorList,
                            // centerText: "Test123",
                            chartType: ChartType.disc,
                            chartRadius: 350,
                            animationDuration: Duration(seconds: 2),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            legendOptions: LegendOptions(
                              legendTextStyle: TextStyle(fontSize: 18),
                              legendPosition: LegendPosition.bottom,
                              legendShape: BoxShape.rectangle,
                              showLegendsInRow: true,
                            ),
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
        ));
  }
}
