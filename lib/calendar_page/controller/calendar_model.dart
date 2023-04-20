import 'package:froot_app/content_model.dart';

class DayContents {
  //일일 수입/소비 내역
  var contentsList = <Content>[];

  //일일 수입, 소비, 낭비, 투자, 예산
  int dayIncome, dayConsumption, dayWaste, dayInvest;

  DayContents({required this.dayIncome,
        required this.dayConsumption,
        required this.dayWaste,
        required this.dayInvest});
}

class MonthContents {
  //일 - 일별 내역
  var dayContentsMap = <int, DayContents>{};

  List<Content> get todayContents {
    var now = DateTime.now();
    return dayContentsMap[now.day]!.contentsList;
  }

  //이번 달 수입, 소비, 낭비, 투자, 예산
  int monthIncome, monthConsumption, monthWaste, monthInvest, monthBudget;

  MonthContents(
      {required this.monthIncome,
        required this.monthConsumption,
        required this.monthWaste,
        required this.monthInvest,
        required this.monthBudget});
}
