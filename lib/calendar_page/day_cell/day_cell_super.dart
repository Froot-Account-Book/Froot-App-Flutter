import 'package:flutter/material.dart';

class DayCellSuper extends StatelessWidget {
  final DateTime date;

  final border = const BorderSide(color: Color.fromRGBO(153, 153, 153, 1), width: 0.5);

  String get showDay => date.day == 1 ? "${date.month}.${date.day}" : date.day.toString();

  const DayCellSuper(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      showDay,
      style: const TextStyle(fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
    );
  }
}
