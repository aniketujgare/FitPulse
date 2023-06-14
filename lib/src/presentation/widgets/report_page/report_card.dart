import '../home_page/card_curve.dart';
import 'report_card_element.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../home_page/point_widget.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.title,
    this.value = '0',
    required this.elements,
    required this.backColor,
    required this.pointColor,
    this.isValueShown = false,
  });

  final String title;
  final String value;
  final Color backColor;
  final Color pointColor;
  final bool isValueShown;
  final List<ReportCardElement> elements;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: Stack(
        children: [
          Visibility(
            visible: isValueShown,
            child: Positioned(
                bottom: 0,
                child: CardCurve(
                    screenHeight: screenHeight, screenWidth: screenWidth)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  PointWidget(pointColor: pointColor),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style:
                        textStyle.copyWith(color: Colors.white, fontSize: 22),
                  )
                ],
              ),
              Visibility(
                visible: isValueShown == false,
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: isValueShown,
                child: Text(
                  value,
                  style: const TextStyle(
                      color: Color(0xff24786B),
                      fontFamily: 'Oswald',
                      fontSize: 110,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: elements,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
