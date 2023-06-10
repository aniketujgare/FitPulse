<<<<<<< HEAD
import 'package:flutter/material.dart';
import '../widgets/home_page/exercise_card.dart';
import '../widgets/home_page/home_header.dart';
import '../widgets/home_page/status_card.dart';
=======
import 'package:fitpulse/src/config/router/app_router_constants.dart';
import 'package:fitpulse/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
>>>>>>> aniket

class HomePage extends StatelessWidget {
  final String userEmail;
  const HomePage({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
                HomeHeader(userEmail: userEmail),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Today's Exercise",
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
                  "Today's Status",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
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
                )
              ],
            ),
          ),
=======
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Text('Home Page + $userEmail'),
            FloatingActionButton(
                onPressed: () => context.read<AuthBloc>().add(LogOutEvent()))
          ],
>>>>>>> aniket
        ),
      ),
    );
  }
}





// Stack(
//   children: [
//     Container(
//       height: screenHeight * 0.1,
//       width: screenWidth * 0.19,
// color: Colors.green,
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.white, Color(0xffCE435D)]),
//           borderRadius: BorderRadius.all(Radius.circular(15))),
//     ),
//     ClipPath(
//       clipper: ProsteBezierCurve(
//         position: ClipPosition.bottom,
//         list: [
//           BezierCurveSection(
//             start: Offset(0, 120),
//             top: Offset(100, 250),
//             end: Offset(30, 100),
//           ),
//           BezierCurveSection(
//             start: Offset(0, 100),
//             top: Offset(60, 30),
//             end: Offset(90, 60),
//           ),
//         ],
//       ),
//       child: Container(
//         height: screenHeight * 0.1,
//         width: screenWidth * 0.19,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Color(0xffC75469), Color(0xffCE435D)]),
//             borderRadius: BorderRadius.all(Radius.circular(15))),
//       ),
//     ),
//   ],
// ),


