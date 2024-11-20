import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/core/model/user_model.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';
import 'package:swifty_companion/modules/home_screen/widget/achievements_widget.dart';

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
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              backgroundColor: flavor.mantle,
              label: Text(
                'Campus: ${user.campus.isNotEmpty ? user.campus.first.name : 'N/A'}',
                style: const TextStyle(fontSize: 16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            const SizedBox(width: 24),
            Chip(
              backgroundColor: flavor.mantle,
              label: Text(
                'Location: ${user.location ?? 'N/A'}',
                style: const TextStyle(fontSize: 16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            )
          ],
        ),
        const SizedBox(height: 12),
        CursusInformation(user: user),
        const SizedBox(height: 16),
        _buildCard(
          title: 'Achievements',
          icon: Icons.star_border,
          flavor: flavor,
        ),
        const SizedBox(height: 8),
        AchievementsWidget(achievements: user.achievements),
        _buildCard(
          title: 'Skills',
          icon: Icons.lightbulb_outline,
          flavor: flavor,
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Flavor flavor,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: flavor.mauve,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: flavor.text,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_down,
              color: flavor.mauve.withOpacity(0.7),
            ),
          ],
        ),
      ),
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
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.displayName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
