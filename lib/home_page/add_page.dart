import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);
  int kindCode = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  '내역 추가',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ToggleSwitch(
              initialLabelIndex: kindCode,
              totalSwitches: 2,
              labels: ['수입', '지출'],
              cornerRadius: 0,
              activeFgColor: Colors.white,
              activeBgColor: [
                Color(0XFF6A93BF),
              ],
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.grey,
              borderColor: [
                Color(0XFF6A93BF),
              ],
              borderWidth: 1,
              minWidth: 125,
              minHeight: 30,
              onToggle: (index) {
                kindCode = index!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
