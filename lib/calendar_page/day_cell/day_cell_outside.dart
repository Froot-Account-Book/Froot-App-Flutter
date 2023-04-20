import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';

class DayCellOutside extends DayCellSuper {
  const DayCellOutside(super.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            border: Border(bottom: border, right: border),
            color: const Color.fromRGBO(249, 249, 249, 1)),
        padding: const EdgeInsets.all(3),
        child: Text(
          showDay,
          style: const TextStyle(
              fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
        ));
  }
}
