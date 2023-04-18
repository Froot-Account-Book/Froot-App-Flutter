import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthStatistics extends StatelessWidget {
  const MonthStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.currency(locale: "ko_KR", symbol: '');
    var txtStyle = const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(17, 17, 17, 1));

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text("수입", style: txtStyle),
            const SizedBox(height: 5),
            Text(
              f.format(520000),
              style: const TextStyle(
                  fontSize: 12, color: Color.fromRGBO(118, 118, 118, 1)),
            ),
          ]),
          Column(children: [
            Text("소비", style: txtStyle),
            const SizedBox(height: 5),
            Text(
              f.format(31100),
              style: const TextStyle(
                  fontSize: 12, color: Color.fromRGBO(106, 147, 191, 1)),
            ),
          ]),
          Column(children: [
            Text("낭비", style: txtStyle),
            const SizedBox(height: 5),
            Text(
              f.format(9800),
              style: const TextStyle(
                  fontSize: 12, color: Color.fromRGBO(217, 99, 100, 1)),
            ),
          ]),
          Column(children: [
            Text("투자", style: txtStyle),
            const SizedBox(height: 5),
            Text(
              f.format(15600),
              style: const TextStyle(
                  fontSize: 12, color: Color.fromRGBO(51, 110, 112, 1)),
            ),
          ]),
          Column(children: [
            Text("남은 예산", style: txtStyle),
            const SizedBox(height: 5),
            Text(
              f.format(443500),
              style: const TextStyle(
                  fontSize: 12, color: Color.fromRGBO(118, 118, 118, 1)),
            ),
          ])
        ]));
  }
}
