import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart' as pw;
import 'package:flutter/material.dart' as pw;
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
//import 'package:flutter/material.dart';

class PdfApi {
  static Future<File> generateCenteredText(double score, String name, String dob, String occupation, String eduLvl, String bankName, int bankAcc, double traditional, double debt, double utilities, double mobile, double shopping) async {
    final DateTime now = new DateTime.now();
    final pdf = Document();

    var assetImage = MemoryImage(
      (await rootBundle.load('assets/images/logoooo.png')).buffer.asUint8List(),
    );
    var color1 = MemoryImage(
      (await rootBundle.load('assets/images/color1.png')).buffer.asUint8List(),
    );
    var color2 = MemoryImage(
      (await rootBundle.load('assets/images/color2.png')).buffer.asUint8List(),
    );
    var color3 = MemoryImage(
      (await rootBundle.load('assets/images/color3.png')).buffer.asUint8List(),
    );
    var color4 = MemoryImage(
      (await rootBundle.load('assets/images/color4.png')).buffer.asUint8List(),
    );
    var color5 = MemoryImage(
      (await rootBundle.load('assets/images/color5.png')).buffer.asUint8List(),
    );

    pdf.addPage(MultiPage(
        build: (context) => <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(child: Image(assetImage), width: 100, height: 100),
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Credit Bee Report',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 170),
                Text(
                  "${DateFormat("dd").format(now)} ${DateFormat("MMMM").format(now)} ${DateFormat("yyyy").format(now)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ]),
              Divider(
                indent: 10,
                thickness: 4,
              ),
              SizedBox(height: 15),
              Column(children: [
                Container(
                    decoration: new BoxDecoration(
                        color: PdfColors.grey800,
                        border: Border.all(color: PdfColors.grey)),
                    height: 30,
                    width: double.infinity,
                    child: Text(
                      'Your Credit Score',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: PdfColors.white),
                    )),
                Container(
                    decoration: new BoxDecoration(
                        border: Border.all(color: PdfColors.grey)),
                    height: 35,
                    width: double.infinity,
                    child: Text(
                      'Your score is ${score.toStringAsFixed(2)}. This is poor score.',
                      style: TextStyle(fontSize: 14),
                    )),
              ]),
              SizedBox(height: 23),
              Column(children: [
                Container(
                    decoration: new BoxDecoration(
                        color: PdfColors.grey800,
                        border: Border.all(color: PdfColors.grey)),
                    height: 35,
                    width: double.infinity,
                    child: Text(
                      'Your Profile Infomation',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: PdfColors.white),
                    )),
                Container(
                    decoration: new BoxDecoration(
                        border: Border.all(color: PdfColors.grey)),
                    width: double.infinity,
                    child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Name: $name',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Date of birth: $dob',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Occupation: $occupation',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Education Level: $eduLvl',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Bank Name: $bankName',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Bank Account: $bankAcc',
                            style: TextStyle(fontSize: 14),
                          ),
                        ])),
              ]),
              SizedBox(height: 30),
              Column(children: [
                Container(
                    decoration: new BoxDecoration(
                        color: PdfColors.grey800,
                        border: Border.all(color: PdfColors.grey)),
                    height: 35,
                    width: double.infinity,
                    child: Text(
                      'Alternative Credit Scoring Performance (Per Month)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: PdfColors.white),
                    )),
                Container(
                    decoration: new BoxDecoration(
                        border: Border.all(color: PdfColors.grey)),
                    width: double.infinity,
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Traditional Bank Data: ${traditional.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Debt Data: ${debt.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Utilities Data: ${utilities.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Mobile Data: ${mobile.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Shopping Data: ${shopping.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ])),
              ]),
              SizedBox(height: 30),
              Column(children: [
                Container(
                    decoration: new BoxDecoration(
                        color: PdfColors.grey800,
                        border: Border.all(color: PdfColors.grey)),
                    height: 35,
                    width: double.infinity,
                    child: Text(
                      'Tips to Improve Your Credit Score',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: PdfColors.white),
                    )),
                Container(
                    decoration: new BoxDecoration(
                        border: Border.all(color: PdfColors.grey)),
                    width: double.infinity,
                    child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              '1. Verify that all the information is accurate'),
                          Text(
                              '-Always make sure they have your correct and updated information so that your latest credit reports will be as accurate as possible.'),
                          Text('2. Set Up Payment Reminders'),
                          Text(
                              '-Set up online reminders and write down payment deadlines for each bill in a planner or calendar. Paying your bills on time on a routine basis can improve your credit score within a few months.'),
                          Text('3. Pay More Than Once in a Billing Cycle'),
                          Text(
                              '-If you can afford it, pay down your bills every two weeks rather than once a month. This lowers your credit utilization and improves your score.'),
                          Text('4. Apply for New Credit Sparingly'),
                          Text(
                              '-Although it increases your total credit limit, it hurts your score if you apply for or open several new accounts in a short time.'),
                          Text('5. Be Careful Paying Off Old Debts'),
                          Text(
                              '-If a debt is charged off by the creditor, it means they do not expect further payments. If you make a payment on a charged off account, it reactivates the debt and lowers your credit score. '),
                          Text('6. Consider a Debt Consolidation Plan'),
                          Text(
                              '-If you can afford it, pay down your bills every two weeks rather than once a month. This lowers your credit utilization and improves your score.'),
                          Text('7. Pay Down Maxed Out Cards First'),
                          Text(
                              '-If you use multiple credit cards and the amount owed on one or more is close to the credit limit, pay that one off first to bring down your credit utilization rate.'),
                        ])),
                SizedBox(height: 30),
                Column(children: [
                  Container(
                      decoration: new BoxDecoration(
                          color: PdfColors.grey800,
                          border: Border.all(color: PdfColors.grey)),
                      height: 35,
                      width: double.infinity,
                      child: Text(
                        'Your Credit Score Range',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: PdfColors.white),
                      )),
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 23, bottom: 0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: [
                              Image(
                                color1,
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
                              Image(
                                color2,
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
                              Image(
                                color3,
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
                              Image(
                                color4,
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
                              Image(
                                color5,
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
                ]),
              ]),
            ]));

    return saveDocument(name: 'Credit_Bee_Report.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
