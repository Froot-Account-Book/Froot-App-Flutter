
import 'package:froot_app/content_model.dart';

String getImageURL(ContentCategory category) {
  switch(category){
    case ContentCategory.income:
      return "assets/images/ico0_income.png";
    case ContentCategory.food:
      return "assets/images/ico1_food.png";
    case ContentCategory.dailyNecessity:
      return "assets/images/ico2_goods.png";
    case ContentCategory.transportation:
      return "assets/images/ico3_transport.png";
    case ContentCategory.culturalLife:
      return "assets/images/ico4_cult.png";
    case ContentCategory.fashionBeauty:
      return "assets/images/ico5_fashion.png";
    case ContentCategory.health:
      return "assets/images/ico6_health.png";
    case ContentCategory.education:
      return "assets/images/ico7_edu.png";
    case ContentCategory.event:
      return "assets/images/ico8_event.png";
    case ContentCategory.etc:
      return "assets/images/ico9_etc.png";
  }
}