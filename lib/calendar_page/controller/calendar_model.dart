import 'package:froot_app/content_model.dart';

class DayContentsModel {
  //일일 수입/소비 내역
  var contentsList = <ContentModel>[];

  //일일 수입, 소비, 낭비, 투자, 예산
  int dayIncome, dayConsumption, dayWaste, dayInvest;

  DayContentsModel({required this.dayIncome,
        required this.dayConsumption,
        required this.dayWaste,
        required this.dayInvest});
}

class MonthContentsModel {
  //일 - 일별 내역
  var dayContentsMap = <int, DayContentsModel>{};

  List<ContentModel> get todayContents {
    var now = DateTime.now();
    return dayContentsMap[now.day]!.contentsList;
  }

  //이번 달 수입, 소비, 낭비, 투자, 예산
  int monthIncome, monthConsumption, monthWaste, monthInvest, monthBudget;

  MonthContentsModel(
      {required this.monthIncome,
        required this.monthConsumption,
        required this.monthWaste,
        required this.monthInvest,
        required this.monthBudget});
}
