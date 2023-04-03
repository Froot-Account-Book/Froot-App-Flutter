import 'package:flutter/material.dart';
import 'package:froot_app/main_navigation/main_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Froot ',
          body: '오늘부터 시작하는 금융 선순환',
          image: Image.asset('image/money_icon.png'),
        ),
        PageViewModel(
          title: '로그인 화면',
          body: 'ㅁㄴㅇㄹ',
          image: Image.asset('image/user_icon.png'),
        ),
      ],
      done: const Text('둘러보기'),
      onDone: () {
        Get.to(() => MainNavigation());
      },
      next: const Icon(Icons.arrow_forward),
    );
  }
}
