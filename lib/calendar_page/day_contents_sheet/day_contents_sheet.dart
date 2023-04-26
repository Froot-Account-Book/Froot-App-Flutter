import 'package:flutter/material.dart';
import 'package:froot_app/calendar_page/controller/calendar_controller.dart';
import 'package:froot_app/calendar_page/model/day_contents_model.dart';
import 'package:froot_app/common_ui/content_list_ui.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DayContentsSheet extends StatelessWidget {
  final DateTime date;

  final defaultTxtStyle =
      const TextStyle(fontSize: 13, color: Color.fromRGBO(153, 153, 153, 1));
  final numberTxtStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  final subTitleTxtStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  const DayContentsSheet(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.currency(locale: "ko_KR", symbol: '');
    var cont = Get.find<CalendarController>();
    var dayContentsData = cont.curMonth.value.dayContentsMap[date.day] ??
        DayContentsModel(income: 0, consumption: 0, waste: 0, invest: 0);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(219, 219, 219, 1),
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Color.fromRGBO(219, 219, 219, 1))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${date.year} / ${date.month} / ${date.day} (${DateFormat.E("ko_KR").format(date)})",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(17, 17, 17, 1),
                        fontWeight: FontWeight.w600),
                  ),
                  const Icon(Icons.question_mark)
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("수입", style: defaultTxtStyle)),
                  Expanded(child: Text("소비", style: defaultTxtStyle)),
                  Expanded(child: Text("낭비", style: defaultTxtStyle)),
                  Expanded(child: Text("투자", style: defaultTxtStyle)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(f.format(dayContentsData.income ?? 0),
                          style: numberTxtStyle)),
                  Expanded(
                      child: Text(f.format(dayContentsData.consumption ?? 0),
                          style: numberTxtStyle)),
                  Expanded(
                      child: Text(f.format(dayContentsData.waste ?? 0),
                          style: numberTxtStyle)),
                  Expanded(
                      child: Text(f.format(dayContentsData.invest ?? 0),
                          style: numberTxtStyle)),
                ],
              ),
              const Divider(
                thickness: 1,
                height: 60,
              ),
              Text("수입 / 지출 내역", style: subTitleTxtStyle),
              const SizedBox(
                height: 30,
              ),
              dayContentsData.contentsList.isEmpty
                  ? const Text("내역이 없습니다.")
                  : Column(
                      children: dayContentsData.contentsList
                          .map((e) => ContentListUI(e))
                          .toList(),
                    ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("피드백", style: subTitleTxtStyle),
                  const Text("수정",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(118, 118, 118, 1)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
