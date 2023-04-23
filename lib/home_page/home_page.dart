import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:froot_app/home_page/parts/title_bar.dart';
import 'package:froot_app/home_page/parts/budget_progress.dart';
import 'package:froot_app/home_page/parts/daily_usage.dart';

import 'home_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TitleBar(
                  titleName: '예산 현황'
              ),
              BudgetProgressPart(
                  month: 4,
                  maxMonthBudget: 300000,
                  availableMonthBudget: 150000
              ),
              const SizedBox(
                height: 40,
              ),
              DailyUsage(
                month: 4,
                date: 23,
                dailySetBudget: 35000,
              ),
            ],
          ),
        ),
    );
  }
}
