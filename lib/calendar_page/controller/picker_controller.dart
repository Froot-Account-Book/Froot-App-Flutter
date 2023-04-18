import 'package:get/get.dart';

enum PickerMode{
  month,
  year
}

class PickerController extends GetxController {
  var selectedMode = PickerMode.month.obs;
  var selectedMonth = 4.obs;
  var selectedYear = 2023.obs;

  void selectMode(PickerMode newMode){
    selectedMode.value = newMode;
  }
}
