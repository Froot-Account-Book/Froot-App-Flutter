import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/day_contents_sheet/day_contents_sheet.dart';

class DayCellSuper extends StatelessWidget {
  final DateTime date;

  final border =
      const BorderSide(color: Color.fromRGBO(153, 153, 153, 1), width: 0.5);

  String get showDay =>
      date.day == 1 ? "${date.month}.${date.day}" : date.day.toString();

  const DayCellSuper(this.date, {Key? key}) : super(key: key);

  void onTap(BuildContext context) => showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      isScrollControlled: true,
      builder: (context) => DayContentsSheet(date),
      context: context,
      useSafeArea: true);

  @override
  Widget build(BuildContext context) {
    return Text(
      showDay,
      style: const TextStyle(
          fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1)),
    );
  }
}
