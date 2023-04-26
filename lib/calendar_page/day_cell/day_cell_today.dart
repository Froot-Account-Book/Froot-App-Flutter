import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/calendar_controller.dart';
import 'package:froot_app/calendar_page/day_contents_sheet/day_contents_sheet.dart';
import 'package:get/get.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_inner_contents.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';

class DayCellToday extends DayCellSuper {
  const DayCellToday(super.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cont = Get.find<CalendarController>();

    return GestureDetector(
      onTap: () => showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          isScrollControlled: true,
          builder: (context) => DayContentsSheet(date),
          context: context),
      child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: border, right: border),
              color: Colors.white),
          padding: const EdgeInsets.only(top: 0.12),
          child: LayoutBuilder(builder: (context, constraints) {
            var dayContents = cont.getDayContents(date.day);
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 4,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(color: Colors.indigo),
                    child: Text(
                      showDay,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white),
                    )),
                if (dayContents != null) DayCellInnerContents(dayContents),
              ],
            );
          })),
    );
  }
}
