import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/model/day_contents_model.dart';
import 'package:intl/intl.dart';

class DayCellInnerContents extends StatelessWidget {
  final DayContentsModel dayModel;

  const DayCellInnerContents(this.dayModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.currency(locale: "ko_KR", symbol: '');

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(dayModel.income == null ? '' : "+${f.format(dayModel.income)}",
              style: const TextStyle(
                  fontSize: 10, color: Color.fromRGBO(118, 118, 118, 1))),
          Text(
              dayModel.consumption == null
                  ? ''
                  : "-${f.format(dayModel.consumption)}",
              style: const TextStyle(
                  fontSize: 10, color: Color.fromRGBO(106, 147, 191, 1))),
          Text(
            dayModel.waste == null ? '' : "-${f.format(dayModel.waste)}",
            style: const TextStyle(
                fontSize: 10, color: Color.fromRGBO(217, 99, 100, 1)),
          ),
          Text(
            dayModel.invest == null ? '' : "-${f.format(dayModel.invest)}",
            style: const TextStyle(
                fontSize: 10, color: Color.fromRGBO(51, 110, 112, 1)),
          )
        ],
      ),
    );
  }
}
