import 'package:get/get.dart';

class CalendarController extends GetxController {
  var focusedDay = DateTime.now().obs;

  void gotoMonth(DateTime newDate){
    focusedDay.value = newDate;
  }
}