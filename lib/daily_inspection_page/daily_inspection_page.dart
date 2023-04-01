import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyInspectionPage extends StatelessWidget {
  const DailyInspectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Text("일일점검 화면", style: TextStyle(fontSize: 35)),
      ),
    );
  }
}
