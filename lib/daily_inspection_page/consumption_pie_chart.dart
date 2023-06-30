import 'package:froot_app/daily_inspection_page/controller/consumption_pie_chart_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class ConsumptionPieChart extends StatelessWidget {
  final ConsumptionPieChartController controller =
      Get.put(ConsumptionPieChartController());
  final form = NumberFormat('###,###,###,###');
  final int consumptionParam;
  final int wasteParam;
  final int investmentParam;

  ConsumptionPieChart(
      {required this.consumptionParam,
      required this.wasteParam,
      required this.investmentParam});

  @override
  Widget build(BuildContext context) {
    controller.setData(consumptionParam, wasteParam, investmentParam);

    return PieChart(
      dataMap: {
        "소비 ${form.format(controller.consumption.value)} 원":
            controller.consumption.value.toDouble(),
        "낭비 ${form.format(controller.waste.value)} 원":
            controller.waste.value.toDouble(),
        "투자 ${form.format(controller.investment.value)} 원":
            controller.investment.value.toDouble(),
      },
      chartRadius: MediaQuery.of(context).size.width / 2.8,
      chartLegendSpacing: 32,
      initialAngleInDegree: 90,
      animationDuration: Duration(milliseconds: 0),
      colorList: [
        const Color(0xFF9DB2CF),
        const Color(0xFF79989A),
        const Color(0xFFD89695),
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
    );
  }
}
