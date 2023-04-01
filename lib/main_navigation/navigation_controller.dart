import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  setIndex(int idx) => selectedIndex.value = idx;
}