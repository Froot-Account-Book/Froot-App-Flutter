import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/calendar_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalendarController>();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "소비 달력",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: controller.gotoPreviousMonth,
                icon: const Icon(Icons.keyboard_arrow_left,
                    color: Color.fromRGBO(118, 118, 118, 1)),
              ),
              Obx(() => Text(
                DateFormat.MMMM('ko_KR').format(controller.focusedDay.value),
                style: TextStyle(fontSize: 16, color: Color.fromRGBO(118, 118, 118, 1)),
              ),),
              IconButton(
                onPressed: controller.gotoNextMonth,
                icon: const Icon(Icons.keyboard_arrow_right,
                    color: Color.fromRGBO(118, 118, 118, 1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
