import 'package:flutter/material.dart';
import 'package:froot_app/main_navigation/main_navigation.dart';
import 'package:get/get.dart';
import 'onboarding_page/onboarding.dart';

void main() {
  runApp(FrootApp());
}

class FrootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Froot App",
      theme: ThemeData(
        // fontFamily: 'Pretendard'
      ),
      home: OnBoardingPage(),
    );
  }
}
