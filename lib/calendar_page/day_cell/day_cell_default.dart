import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';

class DayCellDefault extends DayCellSuper {
  const DayCellDefault(super.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          showDay,
          style: TextStyle(
              fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
        )
      ],
    );
  }
}
