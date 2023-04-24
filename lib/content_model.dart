
enum ContentType {
  income,
  consumption,
  waste,
  invest
} //내역의 종류. 수입/소비/낭비/투자 중 하나

enum ContentCategory {
  income, //수입
  food, //식비
  dailyNecessity, //생필품
  transportation, //교통비
  culturalLife, //문화생활
  fashionBeauty, //패션/뷰티
  health, //건강
  education, //교육
  event, // 경조사
  etc // 기타
} //내역의 카테고리. 추가 가능

class ContentModel { //수입/지출 내역
  String name;
  int cost;
  ContentType type;
  ContentCategory category;

  ContentModel(
      {required this.name,
        required this.category,
        required this.cost,
        required this.type});
}
