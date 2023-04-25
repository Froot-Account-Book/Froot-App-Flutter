import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class BudgetProgressPart extends StatelessWidget {
  final int month;
  final int maxMonthBudget;
  final int availableMonthBudget;
  final form = NumberFormat('###,###,###,###');
  BudgetProgressPart(
    {
      super.key,
      required this.month,
      required this.maxMonthBudget,
      required this.availableMonthBudget
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(4, 8), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('$month월'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              padding: const EdgeInsets.all(0),
              lineHeight: 14.0,
              percent: 0.7,
              backgroundColor: Colors.grey.withOpacity(0.5),
              progressColor: const Color(0XFF6A93BF),
              barRadius: const Radius.circular(20.0),
              animation: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '앞으로 $month월 예산인 ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: '${form.format(maxMonthBudget)}원',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' 중',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${form.format(availableMonthBudget)}원',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF7392BB),
                        ),
                      ),
                      const TextSpan(
                        text: '을 사용할 수 있어요',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
