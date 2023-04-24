import 'package:froot_app/content_model.dart';
import 'package:froot_app/calendar_page/model/day_contents_model.dart';

class MonthContentsModel {
  //일 - 일별 내역
  var dayContentsMap = <int, DayContentsModel>{
    24: DayContentsModel(consumption: 104400, waste: 59800, invest: 9800),
    25: DayContentsModel(income: 560000, waste: 35000),
  };

  List<ContentModel> get todayContents {
    var now = DateTime.now();
    return dayContentsMap[now.day]!.contentsList;
  }

  //이번 달 수입, 소비, 낭비, 투자, 예산
  int income, consumption, waste, invest, budget;

  MonthContentsModel(
      {this.income = 0,
      this.consumption = 0,
      this.waste = 0,
      this.invest = 0,
      this.budget = 0});
}
