import 'package:flutter/material.dart';
import 'package:froot_app/common_ui/toggle_switch.dart';
import 'package:froot_app/content_model.dart';
import 'package:froot_app/util/common_util.dart';

class ContentListUI extends StatelessWidget {
  final ContentModel model;

  const ContentListUI(
    this.model, {
    super.key,
  });

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
                radius: 18,
                backgroundColor: Colors.black12,
                child: CircleAvatar(
                  backgroundImage: AssetImage(getImageURL(model.category)), // image asset
                  backgroundColor: Colors.white,
                  radius: 17,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${model.cost}원",
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
          ToggleSwitch(model.type)
        ],
      ),
    );
  }
}
