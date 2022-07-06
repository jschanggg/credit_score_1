import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/cs_onboarding/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppReviewPage extends StatefulWidget {
  const AppReviewPage({Key? key}) : super(key: key);

  @override
  State<AppReviewPage> createState() => _AppReviewPageState();
}

class _AppReviewPageState extends State<AppReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "App Review & Bugs Report",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                right: 10,
                left: 10,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () async {
                        final url = 'https://forms.gle/ScjnHo4f4CXm246Z8';

                        if (await canLaunch(url)) {
                          await launch(url);
                        }
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
                                  'assets/images/appreview.png',
                                  height: 120,
                                  width: 120,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: ListTile(
                                title: Text(
                                  'Review App',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  'Provide developers with your experience, feedback after using the app. Feel free to give us suggestions on how to improve the app.',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: 270,
                        width: 370,
                        decoration: BoxDecoration(
                            color: Color(0xFFd1d9ff),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () async {
                        final url = 'https://forms.gle/JFrGfVH1ZP399QJd7';

                        if (await canLaunch(url)) {
                          await launch(url);
                        }
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
                                  'assets/images/bugreport.png',
                                  height: 120,
                                  width: 120,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: ListTile(
                                title: Text(
                                  'Report Bugs and Errors ',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  'Report all bugs and errors you found while using the Credit Bee app',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: 270,
                        width: 370,
                        decoration: BoxDecoration(
                            color: Color(0xFFd1d9ff),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
