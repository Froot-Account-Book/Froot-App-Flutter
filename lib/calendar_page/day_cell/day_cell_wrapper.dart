import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/day_cell/day_cell_super.dart';

class DayCellWrapper extends StatelessWidget {
  final DayCellSuper dayCell;
  final bool isOutside;

  const DayCellWrapper(this.dayCell, {Key? key, this.isOutside = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = BorderSide(color: Color.fromRGBO(153, 153, 153, 1), width: 0.5);
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          border: Border(bottom: border, right: border),
          color: isOutside ? Color.fromRGBO(249, 249, 249, 1) : Colors.white),
      padding: EdgeInsets.all(3),
      child: dayCell
    );
  }
}
