import 'package:flutter/material.dart';

import '../../../const.dart';
import '../widgets/profile/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text('Profile', style: textStyle.copyWith(fontSize: 24)),
          backgroundColor: const Color(0xffF7F7F7),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.border_color,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  'https://i.zoomtventertainment.com/89603916_860872437671675_8368801269262698689_n_1584347986__rend_9_16.jpg?tr=w-600'),
            ),
            Text('Alexendra D',
                style: textStyle.copyWith(
                    color: const Color(0xffEA7E43), fontSize: 34)),
            const SizedBox(
              height: 15,
            ),
            const ProfileCard(
              title: 'Email',
              iconPath: 'assets/svg/mail.svg',
              titleValue: 'AlexandriaD@gmail.com',
            ),
            const ProfileCard(
              title: 'Age',
              iconPath: 'assets/svg/age.svg',
              titleValue: '23',
            ),
            const ProfileCard(
              title: 'Gender',
              iconPath: 'assets/svg/gender.svg',
              titleValue: 'Female',
            ),
            const ProfileCard(
              title: 'Weight',
              iconPath: 'assets/svg/weight.svg',
              titleValue: '52',
            ),
            const ProfileCard(
              title: 'Height',
              iconPath: 'assets/svg/height.svg',
              titleValue: '172',
            )
          ]),
        ),
      ),
    );
  }
}
