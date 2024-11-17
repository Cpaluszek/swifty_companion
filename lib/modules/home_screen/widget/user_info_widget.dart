import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty_companion/core/model/user_model.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return UserDetails(userState: state);
        } else if (state is UserError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return const Center(child: Text('No Data'));
        }
      },
    );
  }
}

class UserDetails extends StatelessWidget {
  final UserLoaded userState;

  const UserDetails({super.key, required this.userState});

  @override
  Widget build(BuildContext context) {
    final user = userState.user;

    // TODO: Chip(label: Text(user.kind)),
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfileHeader(user: user),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              label: Text(
                'Campus: ${user.campus.isNotEmpty ? user.campus.first.name : 'N/A'}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(width: 24),
            Chip(
              label: Text(
                'Location: ${user.location ?? 'N/A'}',
                style: const TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        CursusInformation(user: user),
        const SizedBox(height: 4),
        const Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'TODO Achievements',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'TODO Skills',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  final UserModel user;

  const UserProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.image.versions.small),
            radius: 50,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.displayName,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                user.login,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CursusInformation extends StatelessWidget {
  final UserModel user;

  const CursusInformation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    if (user.cursusUsers.isEmpty) {
      return const Text('No Cursus Data Available', style: TextStyle(fontSize: 18));
    }

    final lastCursus = user.cursusUsers.last;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cursus: ${lastCursus.cursus.name}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 24),
                Text(
                  'Grade: ${lastCursus.grade ?? 'N/A'}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Level: ${lastCursus.level}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Pool: ${user.poolMonth} ${user.poolYear}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Correction Points: ${user.evaluationPoints}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Wallet Balance: \$${user.wallet}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
