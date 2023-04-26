import 'package:flutter/material.dart';
import 'package:froot_app/common_ui/content_list_ui.dart';
import 'package:froot_app/content_model.dart';
import 'package:froot_app/daily_inspection_page/title_bar.dart';
import 'package:get/get.dart';

class DailyInspectionPage extends StatelessWidget {
  const DailyInspectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TitleBar(titleName: "일일 점검"),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(4, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    ContentListUI(ContentModel(
                        name: "학식",
                        category: ContentCategory.food,
                        cost: 4500,
                        type: ContentType.waste)),
                    ContentListUI(ContentModel(
                      name: '텀블러',
                      category: ContentCategory.dailyNecessity,
                      cost: 5000,
                      type: ContentType.income,
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
