import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String titleName;

  const TitleBar({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
