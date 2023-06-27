import 'package:flutter/material.dart';
import 'package:froot_app/common_ui/content_list_ui.dart';
import 'package:froot_app/content_model.dart';
import 'package:froot_app/daily_inspection_page/title_bar.dart';
import 'package:froot_app/daily_inspection_page/white_box.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:get/get.dart';

final form = NumberFormat('###,###,###,###');
int month = 0;
int totalConsume = 31100;
int totalWaste = 9800;
int totalInvest = 15600;
int totalSum = (totalConsume + totalWaste + totalInvest);

bool isMoreWaste = false;

Map<String, double> dataMap = {
  "소비 ${form.format(totalConsume)} 원": (totalConsume / totalSum) * 100,
  "낭비 ${form.format(totalWaste)} 원": (totalConsume / totalWaste) * 100,
  "투자 ${form.format(totalInvest)} 원": (totalConsume / totalInvest) * 100,
};

class DailyInspectionPage extends StatelessWidget {
  const DailyInspectionPage({super.key});

  final int percentage = 999;

  @override
  Widget build(BuildContext context) {
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
                Text(
                  '오늘까지의 지출을 반영한',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '${month}월의 지출 비율',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                PieChart(
                  dataMap: dataMap,
                  chartRadius: MediaQuery.of(context).size.width / 2.8,
                  chartLegendSpacing: 32,
                  initialAngleInDegree: 90,
                  animationDuration: Duration(milliseconds: 0),
                  colorList: [
                    Color.fromARGB(0xFF, 157, 178, 207),
                    Color.fromARGB(0xFF, 121, 152, 154),
                    Color.fromARGB(0xFF, 216, 150, 149),
                  ],
                  legendOptions: LegendOptions(
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 0,
                    chartValueStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '지난 달보다',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '${percentage}%p 덜 낭비했어요',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
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
