import 'package:flutter/material.dart';

class DayCellSuper extends StatelessWidget {
  final DateTime day;

  String get showDay {
    return day.day == 1 ? "${day.month}.${day.day}" : day.day.toString();
  }

  const DayCellSuper(this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      showDay,
      style: TextStyle(fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
    );
  }
}
