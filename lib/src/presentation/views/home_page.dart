import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/report_bloc/report_bloc.dart';
import '../widgets/home_page/exercise_card.dart';
import '../widgets/home_page/home_header.dart';
import '../widgets/home_page/status_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Today's Completed Exercise",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                ExerciseCard(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Today's Stats",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<ReportBloc, ReportState>(
                  builder: (context, state) {
                    if (state is ReportLoadedState) {
                      return StatusCard(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: 'Calories Loss',
                        primaryColor: const Color(0xffEA7E43),
                        cardBackgroundColor: const Color(0xffFCDCB2),
                        cardValue: '${state.reportModel.cal}',
                        icon: Icons.local_fire_department,
                        measure: 'Kcal',
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
                  builder: (context, state) {
                    if (state is ReportLoadedState) {
<<<<<<< HEAD
                      double wl = state.reportModel.cal * 0.00013;
                      var weightLoss =
                          double.parse(wl.toStringAsFixed(2)).toString();
=======
                      final cardValue = state.reportModel.cal * 0.00013;

>>>>>>> c734284fdb7928d6cffb26382d088be51a46a576
                      return StatusCard(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: 'Weight Loss',
                        primaryColor: const Color(0xffA087D3),
                        cardBackgroundColor: const Color(0xffE0D2FD),
<<<<<<< HEAD
                        cardValue: weightLoss,
=======
                        cardValue: cardValue.toStringAsFixed(2),
>>>>>>> c734284fdb7928d6cffb26382d088be51a46a576
                        icon: Icons.monitor_weight_outlined,
                        measure: 'Kg',
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: 75,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
