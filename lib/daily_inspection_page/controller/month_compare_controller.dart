import 'package:get/get.dart';

class MonthCompareController extends GetxController {
  RxInt lastMonthExpense = 0.obs;
  RxInt thisMonthExpense = 0.obs;

  void setData(
      int prevMonthTotalConsumptionValue, int currMonthTotalConsumptionValue) {
    this.lastMonthExpense.value = prevMonthTotalConsumptionValue;
    this.thisMonthExpense.value = currMonthTotalConsumptionValue;
  }

  String getGapText() {
    int difference = (thisMonthExpense.value - lastMonthExpense.value);
    int percentPoint =
        ((difference.abs() / lastMonthExpense.value.abs()) * 100).toInt();

    if (difference > 0) {
      return '${percentPoint}%p 지출이 많아요';
    } else if (difference < 0) {
      return '${percentPoint}%p 지출이 적어요';
    } else {
      return '지출이 동일해요';
    }
  }
}
