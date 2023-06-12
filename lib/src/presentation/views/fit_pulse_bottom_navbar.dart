import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/app_navigator_cubit/app_navigator_cubit.dart';

class FitPulseBottomNavBar extends StatelessWidget {
  const FitPulseBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          // bottom: 15,
          // left: 20,
          // right: 20,
          ),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildNavBarItems(
              index: 0,
              context: context,
              svgIcon: 'assets/svg/nav_bar_icons/Home.svg',
            ),
            buildNavBarItems(
              index: 1,
              context: context,
              svgIcon: 'assets/svg/nav_bar_icons/discover-01.svg',
            ),
            buildNavBarItems(
              index: 2,
              context: context,
              svgIcon: 'assets/svg/nav_bar_icons/report.svg',
            ),
            buildNavBarItems(
              index: 3,
              context: context,
              svgIcon: 'assets/svg/nav_bar_icons/Profile.svg',
            ),
          ],
        ),
      ),
    );
  }

  buildNavBarItems({
    required BuildContext context,
    required String svgIcon,
    required int index,
  }) {
    return BlocBuilder<AppNavigatorCubit, AppNavigatorState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<AppNavigatorCubit>().gotoPageAtIndex(index);
          },
          // iconSize: 20,
          splashRadius: 1,
          highlightColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          icon: SvgPicture.asset(
            svgIcon,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              state.index == index ? const Color(0xFFE97E43) : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
