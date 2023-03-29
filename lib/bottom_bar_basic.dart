import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var selectedIndex = 0.obs;

  setIndex(int idx) => selectedIndex.value = idx;
}

class BottomBar extends StatelessWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      '홈',
      style: optionStyle,
    ),
    Text(
      '일일점검',
      style: optionStyle,
    ),
    Text(
      '달력',
      style: optionStyle,
    ),
    Text(
      '예산점검',
      style: optionStyle,
    ),
    Text(
      '설정',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Obx(
            () => Center(
          child: _widgetOptions.elementAt(controller.selectedIndex.value),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(color: Colors.black),
          )
        ),
        child: Obx(
              () => BottomNavigationBar(
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: '일일점검',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: '달력',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: '예산기록',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'sdfd',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 15), onTap: controller.setIndex,
          ),
        ),
      )
    );
  }
}
