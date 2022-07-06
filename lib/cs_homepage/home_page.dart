import 'package:credit_score_1/constants.dart';
import 'package:credit_score_1/cs_homepage/Performance_page/performance_page.dart';
import 'package:credit_score_1/cs_homepage/SettingsPage/settings_page.dart';
import 'package:credit_score_1/cs_homepage/statistic_page.dart';
import 'package:credit_score_1/cs_homepage/credit_report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  List<Widget> pages = [
    TextPointerPage(),
    StatisticPage(),
    PerformancePage(),
    Homepage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       selectedTab(4);
        //     },
        //     child: Icon(
        //       Icons.add,
        //       size: 25,
        //     ),
        //     backgroundColor: kPrimaryColor
        //     //params
        //     ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked
            );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_home,
      Ionicons.md_stats,
      Ionicons.md_clipboard,
      Ionicons.ios_settings
    ];

    return AnimatedBottomNavigationBar(
      activeColor: kPrimaryColor,
      splashColor: kSecondaryColor,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
