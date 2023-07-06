import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/month_compare_controller.dart';

class MonthCompare extends StatelessWidget {
  final MonthCompareController monthCompareController =
      Get.put(MonthCompareController());
  final int lastMonthExpenseParam;
  final int thisMonthExpenseParam;

  MonthCompare(
      {required this.lastMonthExpenseParam,
      required this.thisMonthExpenseParam});

  @override
  Widget build(BuildContext context) {
    monthCompareController.setData(
        lastMonthExpenseParam, thisMonthExpenseParam);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '지난 달과 비교하여',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          monthCompareController.getGapText(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
