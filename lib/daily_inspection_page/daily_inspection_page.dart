import 'package:flutter/material.dart';
import 'package:froot_app/daily_inspection_page/content_list_ui.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text('일일 점검',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.help_outline_sharp,
                  color: Colors.black.withOpacity(0.5),
                  size: 25,
                ),
              ],
            ),
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
                  children:[
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
                        imageURL: '/Users/enty/StudioProjects/Froot-App-Flutter/image/ico2_food.png',
                        contentName: '학식',
                        contentPrice: '4500원',
                        sideText: '맛있다'
                    ),
                    ContentListUI(
                        imageURL: '/Users/enty/StudioProjects/Froot-App-Flutter/image/ico3_goods.png',
                        contentName: '텀블러',
                        contentPrice: '5000원',
                        sideText: '야미'
                    ),
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
