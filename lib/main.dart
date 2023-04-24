import 'package:flutter/material.dart';
import 'package:froot_app/main_navigation/main_navigation.dart';
import 'package:get/get.dart';
import 'onboarding_page/onboarding.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(FrootApp()));
}

class FrootApp extends StatelessWidget {
  bool isLogined = true;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Froot App",
      theme: ThemeData(
          // fontFamily: 'Pretendard'
          ),
      home: isLogined ? MainNavigation() : OnBoardingPage(),
    );
  }
}
