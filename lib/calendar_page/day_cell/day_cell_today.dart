import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';

class DayCellToday extends DayCellSuper {
  final DateTime focusedDay;

  const DayCellToday(super.day, this.focusedDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            border: Border(bottom: border, right: border), color: day.month == focusedDay.month ? Colors.white : const Color.fromRGBO(249, 249, 249, 1)),
        padding: const EdgeInsets.only(top: 0.12),
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
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
              ));
        }));
  }
}
