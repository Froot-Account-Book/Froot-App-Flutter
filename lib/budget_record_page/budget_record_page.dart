import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetRecordPage extends StatelessWidget {
  const BudgetRecordPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text("예산기록 화면", style: TextStyle(fontSize: 35)),
      ),
    );
  }
}
