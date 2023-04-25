import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContentListUI extends StatelessWidget {
  final int imageType;
  final String contentName;
  final int contentPrice;
  final form = NumberFormat('###,###,###,###');
  ContentListUI(
    {
      super.key,
      required this.imageType,
      required this.contentName,
      required this.contentPrice,
    }
  );

  String getImageURL(){
    switch(imageType){
      case 0: return 'assets/images/ico0_income.png';
      case 1: return 'assets/images/ico1_food.png';
      case 2: return 'assets/images/ico2_goods.png';
      case 3: return 'assets/images/ico3_transport.png';
      case 4: return 'assets/images/ico4_cult.png';
      case 5: return 'assets/images/ico5_fashion.png';
      case 6: return 'assets/images/ico6_health.png';
      case 7: return 'assets/images/ico7_edu.png';
      case 8: return 'assets/images/ico8_event.png';
      case 9:
      default:
        return 'assets/images/ico9_etc.png';
    }
  }

  Color getMoneyColor(){
    if(contentPrice>0) {
      return const Color(0XFF6A93BF);
    } else {
      return Colors.black.withOpacity(0.6);
    }
  }

  String getMoneySign(){
    if(contentPrice>0){
      return '+';
    }
    return '';
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius:18,
                backgroundColor: Colors.black12,
                child: CircleAvatar(
                  backgroundImage: AssetImage(getImageURL()), // image asset
                  backgroundColor: Colors.white,
                  radius: 17,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                contentName,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            '${getMoneySign()}${form.format(contentPrice)} 원',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: getMoneyColor(),
            ),
          ),
        ],
      ),
    );
  }
}
