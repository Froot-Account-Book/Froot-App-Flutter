import 'package:flutter/material.dart';

class ContentListUI extends StatelessWidget {
  final String imageURL;
  final String contentName;
  final String contentPrice;
  final String sideText;

  ContentListUI({super.key, required this.imageURL, required this.contentName, required this.contentPrice, required this.sideText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius:18,
                  backgroundColor: Colors.black12,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(imageURL), // image asset
                    backgroundColor: Colors.white,
                    radius: 17,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contentName,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      contentPrice,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
              sideText
          ),
        ],
      ),
    );
  }
}
