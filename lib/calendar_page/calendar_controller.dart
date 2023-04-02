import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CalendarController extends GetxController {
  late PageController pageController;
  var focusedDay = DateTime.now().obs;

  void gotoPreviousMonth() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    focusedDay.value = focusedDay.value.subtract(const Duration(days: 30));
  }
  void gotoNextMonth() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    focusedDay.value = focusedDay.value.add(const Duration(days: 30));
  }
}