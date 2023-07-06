import 'package:flutter/material.dart';
import 'package:froot_app/common_ui/content_list_ui.dart';
import 'package:froot_app/content_model.dart';
import 'package:froot_app/daily_inspection_page/title_bar.dart';
import 'package:froot_app/daily_inspection_page/white_box.dart';
import 'package:froot_app/daily_inspection_page/consumption_pie_chart.dart';
import 'package:froot_app/daily_inspection_page/month_compare.dart';
import 'package:intl/intl.dart';

class DailyInspectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentMonth = DateFormat('M').format(now);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TitleBar(titleName: "일일 점검"),
            WhiteBox(
              children: [
                Text(
                  '오늘의 지출을 돌아보세요',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ContentListUI(
                  ContentModel(
                      name: "학식",
                      category: ContentCategory.food,
                      cost: 4500,
                      type: ContentType.waste),
                ),
                ContentListUI(
                  ContentModel(
                    name: '텀블러',
                    category: ContentCategory.dailyNecessity,
                    cost: 5000,
                    type: ContentType.income,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            WhiteBox(
              children: [
                const Text(
                  '오늘까지의 지출을 반영한',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${currentMonth}월의 지출 비율',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ConsumptionPieChart(
                  consumptionParam: 50000, //이번달 총 소비 데이터
                  wasteParam: 15000, //이번달 총 낭비 데이터
                  investmentParam: 20000, //이번달 총 투자 데이터
                ),
                const SizedBox(
                  height: 15,
                ),
                MonthCompare(
                  lastMonthExpenseParam: 90000, //지난달 총지출 데이터
                  thisMonthExpenseParam: 100000, //이번달 총지출 데이터
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
