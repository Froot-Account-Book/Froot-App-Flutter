import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/picker_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MonthYearPicker extends StatelessWidget {
  final DateTime initialDate;

  const MonthYearPicker(this.initialDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cont = Get.put(PickerController());
    double dialogWidth = Get.width * 0.8;
    double dialogHeight = Get.height * 0.7;
    return Center(
        child: Container(
            color: Colors.white,
            width: dialogWidth,
            height: dialogHeight,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  alignment: Alignment.topLeft,
                  color: Colors.blue,
                  width: dialogWidth,
                  height: dialogHeight * 0.28,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "날짜 선택",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        DateFormat.yMMM('ko_KR').format(initialDate),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Obx(() => Row(
                  children: [
                    SizedBox(width: 15,),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: cont.selectedMode.value ==
                                PickerMode.month
                                ? Colors.blue
                                : Colors.white),
                        onPressed: () =>
                            cont.selectMode(PickerMode.month),
                        child: Text(
                          "달",
                          style: TextStyle(
                              color: cont.selectedMode.value ==
                                  PickerMode.month
                                  ? Colors.white
                                  : Colors.blue),
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                            cont.selectedMode.value == PickerMode.year
                                ? Colors.blue
                                : Colors.white),
                        onPressed: () => cont.selectMode(PickerMode.year),
                        child: Text("년도",
                            style: TextStyle(
                                color: cont.selectedMode.value ==
                                    PickerMode.year
                                    ? Colors.white
                                    : Colors.blue)))
                  ],
                )),
                Container(
                  width: dialogWidth,
                  height: dialogHeight * 0.5,
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(
                        12,
                        (idx) =>
                            TextButton(onPressed: () {}, child: Text("$idx"))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: () {}, child: Text("취소")),
                    TextButton(onPressed: () {}, child: Text("확인")),
                    SizedBox(width: 10,)
                  ],
                ),
              ],
            )));
  }
}
