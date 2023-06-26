import 'package:flutter/material.dart';
import 'package:froot_app/content_model.dart';
import 'package:froot_app/util/common_util.dart';
import 'package:intl/intl.dart';

class ContentListUI extends StatelessWidget {
  final ContentCategory category;
  final String contentName;
  final int contentPrice;
  final form = NumberFormat('###,###,###,###');
  ContentListUI(
    {
      super.key,
      required this.category,
      required this.contentName,
      required this.contentPrice,
    }
  );

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
                  backgroundImage: AssetImage(getImageURL(category)), // image asset
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
