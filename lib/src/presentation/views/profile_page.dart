import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../const.dart';
import '../../config/router/app_router_constants.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/database_bloc/database_bloc.dart';
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
                onPressed: () {
                  context.pushNamed(GoRoutConstants.completeProfileRoutName);
                  // GoRout()
                  //     .router
                  //     .pushNamed(GoRoutConstants.completeProfileRoutName);
                  // Client client = Client();
                  // Databases databases = Databases(client);

                  // client
                  //         .setEndpoint(
                  //             'https://cloud.appwrite.io/v1') // Your API Endpoint
                  //         .setProject('64690d0eedba385967a1') // Your project ID
                  //     ;

                  // Future result1 = databases.createDocument(
                  //   databaseId: '6484be018b503003ea70',
                  //   collectionId: '6484be1836fe39cfbd9e',
                  //   documentId: ID.unique(),
                  //   data: {
                  //     'name': 'aniket',
                  //     'age': 23,
                  //     'gender': 'Male',
                  //     'weight': 52,
                  //     'height': 174,
                  //   },
                  // );

                  // result1.then((response) {
                  //   print(response);
                  // }).catchError((error) {
                  //   print(error.response);
                  // });
                },
                icon: const Icon(
                  Icons.border_color,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogOutEvent());
                },
                icon: const Icon(
                  Icons.logout,
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
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                if (state is DatabaseCurrentUserState) {
                  return Text(state.user.name ?? '-',
                      style: textStyle.copyWith(
                          color: const Color(0xffEA7E43), fontSize: 34));
                }
                return const Text('');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                print(state.toString());
                var email = '-';
                if (state is DatabaseCurrentUserState) {
                  email = state.user.email;
                }
                return ProfileCard(
                  title: 'email',
                  iconPath: 'assets/svg/mail.svg',
                  titleValue: email,
                );
              },
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                int? age;
                if (state is DatabaseCurrentUserState) {
                  age = state.user.height;
                }
                return ProfileCard(
                  title: 'Age',
                  iconPath: 'assets/svg/age.svg',
                  titleValue: '${age ?? '-'}',
                );
              },
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                String gender = 'Male';
                if (state is DatabaseCurrentUserState) {
                  gender = state.user.gender ?? '-';
                }
                return ProfileCard(
                  title: 'Gender',
                  iconPath: 'assets/svg/gender.svg',
                  titleValue: gender,
                );
              },
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                int? weight;
                if (state is DatabaseCurrentUserState) {
                  weight = state.user.weight;
                }
                return ProfileCard(
                  title: 'Weight',
                  iconPath: 'assets/svg/weight.svg',
                  titleValue: '${weight ?? '-'}',
                );
              },
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                int? height;
                if (state is DatabaseCurrentUserState) {
                  height = state.user.height;
                }
                return ProfileCard(
                  title: 'Weight',
                  iconPath: 'assets/svg/weight.svg',
                  titleValue: '${height ?? '-'}',
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
