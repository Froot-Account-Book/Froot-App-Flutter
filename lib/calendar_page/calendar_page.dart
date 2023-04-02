import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/calendar_controller.dart';
import 'package:froot_app/calendar_page/calendar_header.dart';
import 'package:froot_app/calendar_page/month_statistics.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CalendarController());
    return Scaffold(
      body: Column(children: [
        CalendarHeader(),
        MonthStatistics(),
        SizedBox(
          height: 50,
        ),
        Obx(
          () => TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: controller.focusedDay.value,
            headerVisible: false,
            onCalendarCreated: (ctr) => controller.pageController = ctr,
            locale: "ko_KR",
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date),
              decoration: BoxDecoration( color: Color.fromRGBO(231, 231, 231, 1)),
              weekdayStyle: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(118, 118, 118, 1)),
              weekendStyle: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(118, 118, 118, 1))
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) => defaultDayUI(day),
              outsideBuilder: (context, day, focusedDay) =>
                  defaultDayUI(day, true),
            ),
          ),
        )
      ]),
    );
  }

  Widget defaultDayUI(DateTime day, [bool isOutside = false]) {
    String showDay =
        day.day == 1 ? "${day.month}.${day.day}" : day.day.toString();
    Color strokeColor = Color.fromRGBO(153, 153, 153, 1);
    Color outsideColor = Color.fromRGBO(249, 249, 249, 1);
    var border = BorderSide(color: strokeColor, width: 0.5);

    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          border: Border(bottom: border, right: border),
          color: isOutside ? outsideColor : Colors.white),
      padding: EdgeInsets.all(3),
      child: Text(
        showDay,
        style: TextStyle(fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
      ),
    );
  }
}
