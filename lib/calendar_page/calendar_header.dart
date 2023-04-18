import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/calendar_controller.dart';
import 'package:froot_app/calendar_page/month_year_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalendarController>();

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "소비 달력",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => MonthYearPicker(controller.focusedDay.value),
                ),
                child: Obx(
                  () => Text(
                    DateFormat.yMMM('ko_KR')
                        .format(controller.focusedDay.value),
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromRGBO(118, 118, 118, 1)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
