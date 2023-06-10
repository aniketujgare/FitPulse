import 'package:fitpulse/src/presentation/views/complete_profile_page.dart';
import 'package:fitpulse/src/presentation/views/exercise_details_page.dart';
import 'package:fitpulse/src/presentation/views/exercises_page.dart';
import 'package:fitpulse/src/presentation/views/home_page.dart';
import 'package:fitpulse/src/presentation/views/profile_page.dart';
import 'package:fitpulse/src/presentation/views/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_navigator_cubit/app_navigator_cubit.dart';
import 'fit_pulse_bottom_navbar.dart';

class FIitPulseUiNavigator extends StatelessWidget {
  const FIitPulseUiNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<AppNavigatorCubit, AppNavigatorState>(
                builder: (context, state) {
                  return IndexedStack(
                    index: state.index,
                    children: screenList,
                  );
                },
              ),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: FitPulseBottomNavBar()),
            ],
          ),
        ),
      ),
    );
  }
}

var screenList = [
  const HomePage(),
  const ReportPage(),
  const ExerciseDetailsPage(),
  const CompleteProfilePage(),
];
