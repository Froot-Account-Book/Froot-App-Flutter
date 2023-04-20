import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'home_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  const Text('예산 현황',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    Icons.help_outline_sharp,
                    color: Colors.black.withOpacity(0.5),
                    size: 25,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('5월'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        padding: EdgeInsets.all(0),
                        lineHeight: 14.0,
                        percent: 0.7,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        progressColor: Color(0XFF6A93BF),
                        barRadius: const Radius.circular(20.0),
                        animation: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '앞으로 5월 예산인 500,000원 중',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '443,000원을 사용할 수 있어요',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        '5월 3일에 소비할 수 있는 금액',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '16,530원',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [


                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
