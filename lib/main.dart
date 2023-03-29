import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_bar_basic.dart';
import 'home_page/home_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/home",
    getPages: [
      GetPage(name: "/login", page: () => BottomBar()),
      GetPage(name: "/home", page: () => HomePage()),
      GetPage(name: "/day_check", page: () => BottomBar()),
      GetPage(name: "/calendar", page: () => BottomBar()),
      GetPage(name: "/setting", page: () => BottomBar()),
      GetPage(name: "/bottombar", page: () => BottomBar()),
    ],
  ));
}
