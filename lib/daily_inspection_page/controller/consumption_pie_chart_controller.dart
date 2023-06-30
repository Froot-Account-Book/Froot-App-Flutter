import 'package:get/get.dart';

class ConsumptionPieChartController extends GetxController {
  RxInt consumption = 0.obs;
  RxInt waste = 0.obs;
  RxInt investment = 0.obs;

  void setData(int consumptionValue, int wasteValue, int investmentValue) {
    this.consumption.value = consumptionValue;
    this.waste.value = wasteValue;
    this.investment.value = investmentValue;
  }
}
