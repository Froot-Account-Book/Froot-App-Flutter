import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/calendar_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:froot_app/calendar_page/day_cell/day_cell_default.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_outside.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_today.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalendarController>();
    return Obx(
      () => TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: controller.focusedDay.value,
        headerVisible: false,
        locale: "ko_KR",
        daysOfWeekHeight: 22,
        rowHeight: Get.height * 0.11,
        sixWeekMonthsEnforced: true,
        onPageChanged: controller.gotoMonth,
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) => DayCellDefault(day),
          outsideBuilder: (context, day, focusedDay) => DayCellOutside(day),
          todayBuilder: (context, day, focusedDay) {
            if (day.month != focusedDay.month) {
              return DayCellOutside(day);
            }
            return DayCellToday(day, focusedDay);
          },
          dowBuilder: (context, day) {
            return Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(231, 231, 231, 1)),
              alignment: Alignment.center,
              child: Text(
                DateFormat.E("ko_KR").format(day),
                style: const TextStyle(
                    fontSize: 12, color: Color.fromRGBO(118, 118, 118, 1)),
              ),
            );
          },
        ),
      ),
    );
  }
}
