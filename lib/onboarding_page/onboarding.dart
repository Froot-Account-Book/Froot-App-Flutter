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
          title: 'Welcome to my app',
          body: 'This is the first page',
        ),
      ],
      done: const Text('done'),
      onDone: () {
        Get.to(() => MainNavigation());
      },
      next: const Icon(Icons.arrow_forward),
    );
  }
}
