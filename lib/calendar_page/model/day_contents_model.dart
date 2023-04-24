import 'package:froot_app/content_model.dart';

class DayContentsModel {
  //일일 수입/소비 내역
  var contentsList = <ContentModel>[];

  //일일 수입, 소비, 낭비, 투자, 예산
  int? income, consumption, waste, invest;

  DayContentsModel({this.income, this.consumption, this.waste, this.invest});
}
