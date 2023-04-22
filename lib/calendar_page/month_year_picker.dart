import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/picker_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MonthYearPicker extends StatelessWidget {
  PickerController cont;

  MonthYearPicker(DateTime initialDate, {Key? key})
      : cont = PickerController(initialDate),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double pickerWidth = Get.width * 0.3;
    double pickerHeight = Get.height * 0.3;
    double itemHeight = Get.height * 0.05;

    int nowYear = DateTime.now().year - 2000;

    return Center(
      child: Container(
          width: Get.width * 0.7,
          height: Get.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => Text(
                cont.curDate,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    height: pickerHeight,
                    width: pickerWidth,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: cont.yearIdx.value),
                      itemExtent: itemHeight,
                      onSelectedItemChanged: cont.changeYear,
                      children: List.generate(nowYear + 1,
                          (idx) => Center(child: Text("${2000 + idx}"))),
                    )),
                SizedBox(
                    height: pickerHeight,
                    width: pickerWidth,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: cont.monthIdx.value),
                      itemExtent: itemHeight,
                      onSelectedItemChanged: cont.changeMonth,
                      children: List.generate(
                          12, (idx) => Center(child: Text("${idx + 1}"))),
                    )),
              ]),
              TextButton(
                  onPressed: () =>
                      Get.back(result: DateTime(cont.yearVal, cont.monthVal)),
                  child: const Text(
                    "확인",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
    );
  }
}
