import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonthYearPicker extends StatelessWidget {
  final DateTime initialDate;
  int selectedYearIdx, selectedMonthIdx;

  MonthYearPicker(this.initialDate, {Key? key})
      : selectedYearIdx = initialDate.year - 2000,
        selectedMonthIdx = initialDate.month - 1,
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
              const Text(
                "날짜 선택",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    height: pickerHeight,
                    width: pickerWidth,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: selectedMonthIdx),
                      itemExtent: Get.height * 0.05,
                      onSelectedItemChanged: (newMonth) =>
                          selectedMonthIdx = newMonth,
                      children: List.generate(
                          12, (idx) => Center(child: Text("${idx + 1}"))),
                    )),
                SizedBox(
                    height: pickerHeight,
                    width: pickerWidth,
                    child: CupertinoPicker(
                      scrollController:
                          FixedExtentScrollController(initialItem: selectedYearIdx),
                      itemExtent: itemHeight,
                      onSelectedItemChanged: (newYear) =>
                          selectedYearIdx = newYear,
                      children: List.generate(nowYear + 1,
                          (idx) => Center(child: Text("${2000 + idx}"))),
                    )),
              ]),
              TextButton(
                  onPressed: () => Get.back(
                      result: DateTime(
                          selectedYearIdx + 2000, selectedMonthIdx + 1)),
                  child: const Text(
                    "확인",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
    );
  }
}
