import 'package:eaglone/view/Home%20Screen/home_screen.dart';
import 'package:eaglone/view/Navigation/tabbar.dart';
import 'package:eaglone/view/News%20Screen/news_screen.dart';
import 'package:eaglone/view/Paid%20Course%20Screen/paidcourse_screen,.dart';
import 'package:eaglone/view/Settings%20Screen/settings_screen.dart';
import 'package:eaglone/view/Splash%20Screens/splash_screen.dart';
import 'package:eaglone/view/const.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationBarScreen extends StatefulWidget {
  NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int indexx = 0;
  final pages = <Widget>[
    HomeScreen(),
    NewsScreen(),
    PaidCourseScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: pages[indexx],
      bottomNavigationBar:
          TabBarMaterialWidget(inddex: indexx, onChangedTab: OnchangedtTab),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeGreen,
        onPressed: () {},
        child: Icon(Iconsax.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void OnchangedtTab(int indexc) {
    setState(() {
      this.indexx = indexc;
    });
  }
}
