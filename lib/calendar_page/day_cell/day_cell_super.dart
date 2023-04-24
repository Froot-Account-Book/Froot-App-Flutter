import 'package:flutter/material.dart';

class DayCellSuper extends StatelessWidget {
  final DateTime day;

  final border = const BorderSide(color: Color.fromRGBO(153, 153, 153, 1), width: 0.5);

  String get showDay => day.day == 1 ? "${day.month}.${day.day}" : day.day.toString();

  const DayCellSuper(this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      showDay,
      style: const TextStyle(fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
    );
  }
}
