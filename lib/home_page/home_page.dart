import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("FrootFroot", style: TextStyle(fontSize: 35)),
            ElevatedButton(
                onPressed: () => Get.toNamed("/bottombar"), child: Text("네이게이션 바 화면"))
          ],
        ),
      ),
    ));
  }
}
