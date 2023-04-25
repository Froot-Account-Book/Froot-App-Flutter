import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/calendar_controller.dart';
import 'package:get/get.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_inner_contents.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';

class DayCellToday extends DayCellSuper {

  const DayCellToday(super.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cont = Get.find<CalendarController>();

    return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            border: Border(bottom: border, right: border), color: Colors.white),
        padding: const EdgeInsets.only(top: 0.12),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight/4,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(color: Colors.indigo),
                  child: Text(
                    showDay,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white
                    ),
                  )),
              if(cont.getDayContents(day.day) != null) DayCellInnerContents(cont.getDayContents(day.day)!),
            ],
          );
        }));
  }
}
