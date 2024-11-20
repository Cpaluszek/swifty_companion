import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
    final flavor = Provider.of<Flavor>(context);
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
              backgroundColor: flavor.mantle,
              label: Text(
                'Campus: ${user.campus.isNotEmpty ? user.campus.first.name : 'N/A'}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(width: 24),
            Chip(
              backgroundColor: flavor.mantle,
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

    final flavor = Provider.of<Flavor>(context);
    final lastCursus = user.cursusUsers.last;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lastCursus.cursus.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 64),
                Text(
                  lastCursus.grade ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Level Progress
            Stack(
              alignment: Alignment.center, // Center the text
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: lastCursus.level - lastCursus.level.truncateToDouble(),
                    color: flavor.lavender,
                    backgroundColor: flavor.lavender.withOpacity(.2),
                    minHeight: 20,
                  ),
                ),
                Text(
                  'Level ${lastCursus.level.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: flavor.surface1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Information Section
            Row(
              children: [
                Icon(Icons.assessment_outlined, color: flavor.mauve),
                const SizedBox(width: 8),
                const Text(
                  'Evaluation Points:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${user.evaluationPoints}',
                  style: TextStyle(fontSize: 16, color: flavor.mauve),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.account_balance_wallet_outlined, color: flavor.mauve),
                const SizedBox(width: 8),
                const Text(
                  'Wallet Balance:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '\$${user.wallet}',
                  style: TextStyle(fontSize: 16, color: flavor.mauve),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.pool_outlined, color: flavor.mauve),
                const SizedBox(width: 8),
                const Text(
                  'Pool:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${user.poolMonth} ${user.poolYear}',
                  style: TextStyle(fontSize: 16, color: flavor.mauve),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
