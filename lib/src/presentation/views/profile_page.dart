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
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                if (state is DatabaseCurrentUserState &&
                    state.user.profilePic != '') {
                  return CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(state.user.profilePic!),
                  );
                } else {
                  return const CircleAvatar(
                    radius: 80,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.black,
                    ),
                  );
                }
              },
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              buildWhen: (previous, current) => true,
              builder: (context, state) {
                if (state is DatabaseCurrentUserState) {
                  return Text(state.user.name ?? '-',
                      style: textStyle.copyWith(
                          color: const Color(0xffEA7E43), fontSize: 34));
                } else if (state is DatabaseLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Text('');
                }
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
                  title: 'Email',
                  iconPath: 'assets/svg/mail.svg',
                  titleValue: email,
                );
              },
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                int? age;
                if (state is DatabaseCurrentUserState) {
                  age = state.user.age;
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
                  title: 'Height',
                  iconPath: 'assets/svg/height.svg',
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
