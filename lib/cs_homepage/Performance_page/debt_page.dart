import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DebtDataPage extends StatefulWidget {
  const DebtDataPage({Key? key}) : super(key: key);

  @override
  State<DebtDataPage> createState() => _DebtDataPageState();
}

class _DebtDataPageState extends State<DebtDataPage> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = new DateTime.now();
    final user = FirebaseAuth.instance.currentUser!;
    var y1, y2, y3, y4, y5;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5c6bc0),
          title: Text(
            "Debt Data Performance",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
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
                  y1 = snapshot.data!['CarLoan'];
                  y2 = snapshot.data!['HouseLoan'];
                  y3 = snapshot.data!['StudentLoan'];
                  y4 = snapshot.data!['OutstandingBills'];
                  y5 = snapshot.data!['Rental'];
                  final y = y1 + y2 + y3 + y4 + y5;

                  return Column(children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 20,
                          left: 8,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              // child: Text(
                              //   'Total % of this month',
                              //   style: TextStyle(
                              //       fontSize: 20, fontWeight: FontWeight.bold),
                              // ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  "${DateFormat("MMMM").format(now)}, ${DateFormat("yyyy").format(now)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Row(children: [
                    //   Padding(
                    //     padding: EdgeInsets.only(left: 15),
                    //     child: GestureDetector(
                    //       child: Container(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [],
                    //         ),
                    //         height: 145,
                    //         width: 185,
                    //         decoration: BoxDecoration(
                    //             color: Color(0xFF9fa8da),
                    //             borderRadius: BorderRadius.circular(30)),
                    //       ),
                    //     ),
                    //   ),
                    //   SizedBox(
                    //     width: 10,
                    //   ),
                    //   Padding(
                    //     padding: EdgeInsets.only(right: 10),
                    //     child: GestureDetector(
                    //       child: Container(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [],
                    //         ),
                    //         height: 145,
                    //         width: 185,
                    //         decoration: BoxDecoration(
                    //             color: Color(0xFF9fa8da),
                    //             borderRadius: BorderRadius.circular(30)),
                    //       ),
                    //     ),
                    //   ),
                    // ]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          tileColor: Color(0xFF26418f),
                          leading: Image.asset('assets/images/carloan.png'),
                          title: Text('Car Loan',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          trailing: Text(
                            '${(y1 / y * 100).toStringAsFixed(2)}%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          tileColor: Color(0xFF26418f),
                          leading: Image.asset('assets/images/houseloan.png'),
                          title: Text('House Loan',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          trailing: Text(
                            '${(y2 / y * 100).toStringAsFixed(2)}%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          tileColor: Color(0xFF26418f),
                          leading: Image.asset('assets/images/studentloan.png'),
                          title: Text('Student Loan',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          trailing: Text(
                            '${(y3 / y * 100).toStringAsFixed(2)}%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          tileColor: Color(0xFF26418f),
                          leading:
                              Image.asset('assets/images/outstandingbill.png'),
                          title: Text('Outstanding Bills',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          trailing: Text(
                            '${(y4 / y * 100).toStringAsFixed(2)}%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          tileColor: Color(0xFF26418f),
                          leading: Image.asset('assets/images/rental.png'),
                          title: Text('Rental',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          trailing: Text(
                            '${(y5 / y * 100).toStringAsFixed(2)}%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]);
                } else {
                  return Container();
                }
              }),
        ));
  }
}
