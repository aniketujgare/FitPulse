import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';

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
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthAuthenticated) {
                  return Text(state.user.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                          fontSize: 24,
                          color: Colors.black));
                } else {
                  return const Text('');
                }
              },
            ),
          ],
        ),
        const Spacer(),
        const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://i1.sndcdn.com/avatars-000731198008-qqej4c-t500x500.jpg',
            )),
      ],
    );
  }
}
