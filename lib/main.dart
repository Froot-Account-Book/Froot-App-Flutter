import 'package:flutter/material.dart';
import 'package:froot_app/auth_pages/login_page/login_page.dart';
import 'package:froot_app/main_navigation/main_navigation.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(FrootApp()));
}

class FrootApp extends StatelessWidget {
  bool isLogined = false;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Froot App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 전체 배경색 완전히 하얗게
        // fontFamily: 'Pretendard'
      ),
      home: isLogined ? MainNavigation() : LoginPage(),
    );
  }
}
