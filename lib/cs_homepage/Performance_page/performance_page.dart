import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/cs_homepage/Performance_page/debt_page.dart';
import 'package:credit_score_1/cs_homepage/Performance_page/mobile_page.dart';
import 'package:credit_score_1/cs_homepage/Performance_page/shopping_page.dart';
import 'package:credit_score_1/cs_homepage/Performance_page/traditionalbank_page.dart';
import 'package:credit_score_1/cs_homepage/Performance_page/utilities_page.dart';
import 'package:credit_score_1/cs_homepage/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class PerformancePage extends StatefulWidget {
  @override
  _PerformancePageState createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  int activeDay = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "Scores Performance",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    //var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 20),
                        child: Text("Alternative Data Categories",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TraditionalBankPage()));
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Image.asset(
                                      'assets/images/bank.png',
                                      height: 80,
                                      width: 80,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Text(
                                    'Traditional \n Bank',
                                    style:
                                        TextStyle(fontSize: 19, color: white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            height: 163,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Color(0xFF26418f),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UtilitiesDataPage()));
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Image.asset(
                                  'assets/images/utilities.png',
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Text('Utilities',
                                    style:
                                        TextStyle(fontSize: 19, color: white),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          height: 163,
                          width: 163,
                          decoration: BoxDecoration(
                              color: Color(0xFF26418f),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DebtDataPage()));
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    //left: 15,
                                    top: 25,
                                  ),
                                  child: Image.asset(
                                    'assets/images/debt.png',
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 13),
                                  child: Text('Debt',
                                      style:
                                          TextStyle(fontSize: 19, color: white),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                            height: 163,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Color(0xFF26418f),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MobileDataPage()));
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Image.asset(
                                  'assets/images/mobile.png',
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text('Mobile',
                                    style:
                                        TextStyle(fontSize: 19, color: white),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          height: 163,
                          width: 163,
                          decoration: BoxDecoration(
                              color: Color(0xFF26418f),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoppingDataPage()));
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Image.asset(
                                      'assets/images/shopping.png',
                                      height: 80,
                                      width: 80,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Text('Shopping',
                                      style:
                                          TextStyle(fontSize: 19, color: white),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                            height: 163,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Color(0xFF26418f),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
