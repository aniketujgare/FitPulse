import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/database_bloc/database_bloc.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Howdy!',
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff767A7D),
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500),
            ),
            BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                if (state is DatabaseCurrentUserState) {
                  return Text(state.user.name ?? 'User',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                          fontSize: 24,
                          color: Colors.black));
                } else {
                  return const Text('User');
                }
              },
            ),
          ],
        ),
        const Spacer(),
        BlocBuilder<DatabaseBloc, DatabaseState>(
          builder: (context, state) {
            if (state is DatabaseCurrentUserState) {
              return CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    state.user.profilePic!,
                  ));
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
