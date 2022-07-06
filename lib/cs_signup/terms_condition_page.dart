import 'package:flutter/material.dart';

class TermsConditionPage extends StatefulWidget {
  const TermsConditionPage({Key? key}) : super(key: key);

  @override
  State<TermsConditionPage> createState() => _TermsConditionPageState();
}

class _TermsConditionPageState extends State<TermsConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "Terms and Conditions",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );


  }
}
