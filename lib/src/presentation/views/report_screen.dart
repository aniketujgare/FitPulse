import 'package:flutter/material.dart';
import '../../../const.dart';
import '../widgets/report_page/report_card.dart';
import '../widgets/report_page/report_card_element.dart';
import '../widgets/home_page/status_card.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Report', style: textStyle.copyWith(fontSize: 24)),
        backgroundColor: const Color(0xffF7F7F7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const ReportCard(
                title: "Today's Status",
                backColor: Color(0xff070B11),
                pointColor: Color(0xff74777D),
                elements: [
                  ReportCardElement(
                    name: "Workout",
                    value: "12",
                    valueColor: Color(0xff4CCDB8),
                  ),
                  ReportCardElement(
                    name: "Kcal",
                    value: "1552",
                    valueColor: Color(0xff4CCDB8),
                  ),
                  ReportCardElement(
                    name: "Time",
                    value: "126",
                    valueColor: Color(0xff4CCDB8),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StatusCard(
                screenWidth: screenWidth,
                title: 'Calories Loss',
                primaryColor: const Color(0xffEA7E43),
                cardBackgroundColor: const Color(0xffFCDCB2),
                cardValue: '15',
                icon: Icons.local_fire_department,
                measure: 'Kcal',
              ),
              const SizedBox(
                height: 20,
              ),
              StatusCard(
                screenWidth: screenWidth,
                title: 'Weight Loss',
                primaryColor: const Color(0xffA087D3),
                cardBackgroundColor: const Color(0xffE0D2FD),
                cardValue: '12',
                icon: Icons.monitor_weight_outlined,
                measure: 'Kg',
              ),
              const SizedBox(
                height: 20,
              ),
              const ReportCard(
                  title: 'BMI',
                  pointColor: Color(0xff24786B),
                  backColor: Color(0xff4CCDB8),
                  isValueShown: true,
                  value: '28',
                  elements: [
                    ReportCardElement(
                      name: "Weight",
                      value: "59",
                      valueColor: Colors.white,
                    ),
                    ReportCardElement(
                      name: "Height",
                      value: "169",
                      valueColor: Colors.white,
                    ),
                  ]),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
