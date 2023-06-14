import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const.dart';
import '../blocs/database_bloc/database_bloc.dart';
import '../blocs/report_bloc/report_bloc.dart';
import '../widgets/home_page/status_card.dart';
import '../widgets/report_page/report_card.dart';
import '../widgets/report_page/report_card_element.dart';

// 0.13 1 cal = 0.00013
class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              BlocBuilder<ReportBloc, ReportState>(
                builder: (context, state) {
                  if (state is ReportLoadedState) {
                    return ReportCard(
                      title: "Today's Stats",
                      backColor: const Color(0xff070B11),
                      pointColor: const Color(0xff74777D),
                      elements: [
                        ReportCardElement(
                          name: "Workout",
                          value: '${state.reportModel.noOfWorkouts}',
                          valueColor: const Color(0xff4CCDB8),
                        ),
                        ReportCardElement(
                          name: "Kcal",
                          value: '${state.reportModel.cal}',
                          valueColor: const Color(0xff4CCDB8),
                        ),
                        ReportCardElement(
                          name: "Time(mins)",
                          value: '${state.reportModel.time}',
                          valueColor: const Color(0xff4CCDB8),
                        ),
                      ],
                    );
                  } else if (state is ReportLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ReportBloc, ReportState>(
                buildWhen: (previous, current) => true,
                builder: (context, state) {
                  if (state is ReportLoadedState) {
                    return StatusCard(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      title: 'Calories Loss so far',
                      primaryColor: const Color(0xffEA7E43),
                      cardBackgroundColor: const Color(0xffFCDCB2),
                      cardValue: '${state.reportModel.cal}',
                      icon: Icons.local_fire_department,
                      measure: 'Kcal',
                    );
                  } else if (state is ReportLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ReportBloc, ReportState>(
                buildWhen: (previous, current) => true,
                builder: (context, state) {
                  if (state is ReportLoadedState) {
                    double n = state.reportModel.cal * 0.00013;
                    return StatusCard(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      title: 'Weight Loss so far',
                      primaryColor: const Color(0xffA087D3),
                      cardBackgroundColor: const Color(0xffE0D2FD),
                      cardValue: double.parse(n.toStringAsFixed(2)).toString(),
                      icon: Icons.monitor_weight_outlined,
                      measure: 'Kg',
                    );
                  } else if (state is ReportLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<DatabaseBloc, DatabaseState>(
                builder: (context, state) {
                  if (state is DatabaseCurrentUserState) {
                    var heightSquare = (state.user.height! * 0.01) *
                        (state.user.height! * 0.01);
                    var weight = state.user.weight;
                    var bmival = weight! / heightSquare;
                    var intBmival = bmival.toInt();
                    return ReportCard(
                        title: 'BMI',
                        pointColor: Color(0xff24786B),
                        backColor: Color(0xff4CCDB8),
                        isValueShown: true,
                        value: '$intBmival',
                        elements: [
                          ReportCardElement(
                            name: "Weight",
                            value: '${state.user.weight}',
                            valueColor: Colors.white,
                          ),
                          ReportCardElement(
                            name: "Height",
                            value: '${state.user.height}',
                            valueColor: Colors.white,
                          ),
                        ]);
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 75),
            ],
          ),
        ),
      ),
    ));
  }
}
