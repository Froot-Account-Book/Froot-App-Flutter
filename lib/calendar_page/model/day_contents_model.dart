import 'package:froot_app/content_model.dart';

class DayContentsModel {
  //일일 수입/소비 내역
  var contentsList = <ContentModel>[
    ContentModel(name: "술", category: ContentCategory.food, cost: 21300, type: ContentType.waste),
    ContentModel(name: "맥도날드", category: ContentCategory.fashionBeauty, cost: -8000, type: ContentType.consumption),
    ContentModel(name: "버스", category: ContentCategory.transportation, cost: -8000, type: ContentType.consumption),
    ContentModel(name: "학식", category: ContentCategory.dailyNecessity, cost: -5000, type: ContentType.consumption),
    ContentModel(name: "노래방", category: ContentCategory.culturalLife, cost: -3000, type: ContentType.waste),
    ContentModel(name: "편의점 알바", category: ContentCategory.income, cost: 370000, type: ContentType.income),
  ];

  //일일 수입, 소비, 낭비, 투자, 예산
  int? income, consumption, waste, invest;

  DayContentsModel({this.income, this.consumption, this.waste, this.invest});
}
