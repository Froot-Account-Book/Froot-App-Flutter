import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:froot_app/home_page/parts/content_list_ui.dart';

class DailyUsage extends StatelessWidget {
  final int month;
  final int date;
  final int dailySetBudget;
  final form = NumberFormat('###,###,###,###');
  DailyUsage(
    {
      super.key,
      required this.month,
      required this.date,
      required this.dailySetBudget
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              '$month월 $date일에 소비할 수 있는 금액',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${form.format(dailySetBudget)}원',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ContentListUI(imageType: 0, contentName: '알바비', contentPrice: 15123123),
            ContentListUI(imageType: 1, contentName: 'hello', contentPrice: -11111),
            ContentListUI(imageType: 7, contentName: 'book', contentPrice: -999999999),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3,260원 초과 지출했습니다',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Color(0XFF6A93BF), // Button color
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
