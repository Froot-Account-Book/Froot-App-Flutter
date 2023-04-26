import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';
import 'package:froot_app/calendar_page/day_contents_sheet/day_contents_sheet.dart';

class DayCellOutside extends DayCellSuper {
  const DayCellOutside(super.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          isScrollControlled: true,
          builder: (context) => DayContentsSheet(date),
          context: context),
      child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              border: Border(bottom: border, right: border),
              color: const Color.fromRGBO(249, 249, 249, 1)),
          padding: const EdgeInsets.all(3),
          child: Text(
            showDay,
            style: const TextStyle(
                fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
          )),
    );
  }
}
