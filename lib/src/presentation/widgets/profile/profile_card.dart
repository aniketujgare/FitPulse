import 'package:fitpulse/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.titleValue,
  });

  final String title;
  final String iconPath;
  final String titleValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(
            iconPath,
            color: const Color(0xff74777D),
            width: 28,
            height: 26,
          ),
          title: Text(
            title,
            style: textStyle.copyWith(
                fontSize: 12,
                color: const Color(0xff74777D),
                fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            titleValue,
            style: textStyle.copyWith(color: const Color(0xff1E232C)),
          ),
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          color: const Color(0xff74777D).withOpacity(0.2),
        )
      ],
    );
  }
}
