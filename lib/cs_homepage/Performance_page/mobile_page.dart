import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MobileDataPage extends StatefulWidget {
  const MobileDataPage({Key? key}) : super(key: key);

  @override
  State<MobileDataPage> createState() => _MobileDataPageState();
}

class _MobileDataPageState extends State<MobileDataPage> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = new DateTime.now();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5c6bc0),
          title: Text(
            "Mobile Data Performance",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
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
                      child: Text(
                        'Total % of this month',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 55),
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
                  leading: Image.asset('assets/images/positivesocialmedia.png'),
                  title: Text('Social Media Platforms (Positive)',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(
                    '123',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '5%',
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
                  leading: Image.asset('assets/images/negativesm.png'),
                  title: Text('Social Media Platforms (Negative)',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(
                    '123',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '5%',
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
                  leading: Image.asset('assets/images/datausage.png'),
                  title: Text('Cellular Data Usage',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(
                    '123',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '5%',
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
                  leading: Image.asset('assets/images/subcriptionfee.png'),
                  title: Text('Subscription Fees',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(
                    '123',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '5%',
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
                  leading: Image.asset('assets/images/topuphistory.png'),
                  title: Text('Top-up History',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(
                    '123',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '5%',
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
                  leading: Image.asset('assets/images/ewallet.png'),
                  title: Text('E-Wallet',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(
                    '123',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '5%',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ));
  }
}
