import 'package:froot_app/calendar_page/model/day_contents_model.dart';
import 'package:froot_app/calendar_page/model/month_contents_model.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var curMonth = MonthContentsModel().obs;

  DayContentsModel? getDayContents(int day) => curMonth.value.dayContentsMap[day];

  void gotoMonth(DateTime newDate) {
    focusedDay.value = newDate;
  }
}