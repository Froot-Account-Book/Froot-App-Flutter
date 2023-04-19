import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'navigation_controller.dart';

import 'package:froot_app/home_page/home_page.dart';
import 'package:froot_app/daily_inspection_page/daily_inspection_page.dart';
import 'package:froot_app/calendar_page/calendar_page.dart';
import 'package:froot_app/budget_record_page/budget_record_page.dart';
import 'package:froot_app/setting_page/setting_page.dart';

class MainNavigation extends StatelessWidget {
  final _widgetOptions = const [
    HomePage(), //홈
    DailyInspectionPage(), //일일점검
    CalendarPage(), //달력
    BudgetRecordPage(), //예산기록
    SettingPage() //설정
  ];

  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
        body: SafeArea(child: Center(child: Obx(() => _widgetOptions.elementAt(controller.selectedIndex.value)),)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Color.fromRGBO(153, 153, 153, 0.5)))),
          child: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wb_sunny),
                  label: '일일점검',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: '달력',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet),
                  label: '예산기록',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: '설정',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: Colors.black,
              onTap: controller.setIndex,
            ),
          ),
        ));
  }
}
