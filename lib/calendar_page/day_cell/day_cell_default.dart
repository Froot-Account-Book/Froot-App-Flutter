import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/calendar_controller.dart';
import 'package:get/get.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_inner_contents.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';

class DayCellDefault extends DayCellSuper {
  const DayCellDefault(super.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cont = Get.find<CalendarController>();

    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              border: Border(bottom: border, right: border),
              color: Colors.white),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 4,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      showDay,
                      style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(118, 118, 118, 1)),
                    )),
                if (cont.getDayContents(date.day) != null)
                  DayCellInnerContents(cont.getDayContents(date.day)!),
              ],
            );
          })),
    );
  }
}
