import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:froot_app/calendar_page/calendar_body.dart';
import 'package:froot_app/calendar_page/controller/calendar_controller.dart';
import 'package:froot_app/calendar_page/calendar_header.dart';
import 'package:froot_app/calendar_page/month_statistics.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarController());
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CalendarHeader(), //제목 및 캘린더 컨트롤러
          MonthStatistics(), //이번달 통계
          CalendarBody() //캘린더
        ]);
  }
}

//TODO 1. DayContentsSheet가 showModalBottomSheet + isScrollControlled: true 조합으로 유튜브 댓글창 UI 흉내를 겨우 내는중임. 아직 완전하지 않아서 설정을 더 찾든 라이브러리를 쓰던 해야함.
// DayCellSuper의 onTap 함수에 있음. https://pub.dev/packages/snapping_sheet 라이브러리를 쓰면 될 것 같음.
//TODO 2. 달력 부분 성능이 너무 안나옴. getx 컨트롤러 말고 다른 방법을 사용할 수 있을 것 같은데 찾아봐야 할 듯.
//TODO 3. UI를 16:9 기준으로 만드는 바람에 도안이랑 안 맞는 부분이 있음. 전반적인 수정 필요.