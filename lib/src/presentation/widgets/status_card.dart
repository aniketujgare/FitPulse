import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
    required this.primaryColor,
    required this.cardBackgroundColor,
    required this.cardValue,
    required this.icon,
    required this.measure,
  });

  final double screenHeight;
  final double screenWidth;
  final String title;
  final Color primaryColor;
  final Color cardBackgroundColor;
  final String cardValue;
  final IconData icon;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.18,
      width: screenWidth * 0.43,
      decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Stack(children: [
        Positioned(
            top: 15,
            left: 15,
            child: StatusCardHeader(
              title: title,
              pointColor: primaryColor,
            )),
        Positioned(
            top: 25,
            left: 15,
            right: 20,
            child: StatusCardData(
              cardValue: cardValue,
              statusCardColor: primaryColor,
              icon: icon,
              measure: measure,
            ))
      ]),
    );
  }
}

class StatusCardData extends StatelessWidget {
  const StatusCardData(
      {super.key,
      required this.cardValue,
      required this.statusCardColor,
      required this.measure,
      required this.icon});

  final String cardValue;
  final Color statusCardColor;
  final String measure;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cardValue,
          style: TextStyle(
              fontSize: 100,
              fontFamily: 'Oswald',
              fontWeight: FontWeight.bold,
              color: statusCardColor),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              measure,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: statusCardColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: statusCardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Icon(icon, size: 40),
            )
          ],
        )
      ],
    );
  }
}

class StatusCardHeader extends StatelessWidget {
  const StatusCardHeader({
    super.key,
    required this.title,
    required this.pointColor,
  });
  final String title;
  final Color pointColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 8,
          decoration: BoxDecoration(
              color: pointColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
