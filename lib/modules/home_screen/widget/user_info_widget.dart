import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/core/model/user_model.dart';
import 'package:swifty_companion/modules/home_screen/bloc/user_bloc.dart';
import 'package:swifty_companion/modules/home_screen/widget/achievements_bottom_sheet.dart';
import 'package:swifty_companion/modules/home_screen/widget/projects_bottom_sheet.dart';
import 'package:swifty_companion/modules/home_screen/widget/skills_bottom_sheet.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return UserDetails(user: state.user);
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
  final UserModel user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfileHeader(user: user),
        const SizedBox(height: 12),
        InfoChips(
          campus: user.campus.isNotEmpty ? user.campus.first.name : 'N/A',
          location: user.location ?? 'N/A',
        ),
        const SizedBox(height: 12),
        CursusInformation(user: user),
        const SizedBox(height: 12),
        ModalButton(
          title: 'Achievements',
          icon: Icons.star_border,
          modal: AchievementsBottomSheet(achievements: user.achievements),
        ),
        const SizedBox(height: 12),
        ModalButton(
          title: 'Skills',
          icon: Icons.lightbulb_outline,
          modal: SkillsBottomSheet(skills: user.getAllSkills()),
        ),
        const SizedBox(height: 12),
        ModalButton(
          title: 'Projects',
          icon: Icons.cases_outlined,
          modal: ProjectsBottomSheet(projects: user.getFilteredProjects(), cursus: user.cursusUsers),
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
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.displayName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                user.login,
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoChips extends StatelessWidget {
  final String campus;
  final String location;

  const InfoChips({super.key, required this.campus, required this.location});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChip(label: 'Campus: $campus', flavor: flavor),
        const SizedBox(width: 24),
        _buildChip(label: 'Location: $location', flavor: flavor),
      ],
    );
  }

  Widget _buildChip({required String label, required Flavor flavor}) {
    return Chip(
      backgroundColor: flavor.mantle,
      label: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}

class ModalButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget modal;

  const ModalButton({super.key, required this.title, required this.icon, required this.modal});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: flavor.mantle,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          builder: (_) => modal,
        );
      },
      child: Row(
        children: [
          Icon(icon, size: 24, color: flavor.mauve),
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
          Icon(Icons.chevron_right, color: flavor.mauve.withOpacity(0.7)),
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
      return const Center(child: Text('No Cursus Data Available'));
    }

    final flavor = Provider.of<Flavor>(context);
    final lastCursus = user.cursusUsers.last;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderRow(lastCursus.cursus.name, lastCursus.grade ?? 'N/A'),
            const SizedBox(height: 12),
            _buildProgressBar(lastCursus.level, flavor),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.assessment_outlined, 'Evaluation Points:', '${user.evaluationPoints}', flavor),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.account_balance_wallet_outlined, 'Wallet Balance:', '\$${user.wallet}', flavor),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.pool_outlined, 'Pool:', '${user.poolMonth} ${user.poolYear}', flavor),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(String cursusName, String grade) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cursusName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 64),
        Text(
          grade,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProgressBar(double level, Flavor flavor) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: level - level.truncateToDouble(),
            color: flavor.lavender,
            backgroundColor: flavor.lavender.withOpacity(.2),
            minHeight: 20,
          ),
        ),
        Text(
          'Level ${level.toStringAsFixed(2)}',
          style: TextStyle(color: flavor.surface1, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, Flavor flavor) {
    return Row(
      children: [
        Icon(icon, color: flavor.mauve),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Spacer(),
        Text(value, style: TextStyle(fontSize: 16, color: flavor.mauve)),
      ],
    );
  }
}
