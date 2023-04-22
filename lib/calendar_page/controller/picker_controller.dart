import 'package:get/get.dart';

class PickerController extends GetxController {
  RxInt yearIdx, monthIdx;

  PickerController(DateTime date)
      : yearIdx = (date.year - 2000).obs,
        monthIdx = (date.month - 1).obs;

  int get yearVal => yearIdx.value + 2000;
  int get monthVal => monthIdx.value + 1;
  String get curDate => "$yearVal년 $monthVal월";

  void changeYear(int newYear) => yearIdx.value = newYear;

  void changeMonth(int newMonth) => monthIdx.value = newMonth;
}
