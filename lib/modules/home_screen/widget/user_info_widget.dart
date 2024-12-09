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
  final BaseUserBloc userBloc;

  const UserInfoWidget({super.key, required this.userBloc});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    return BlocBuilder<BaseUserBloc, UserState>(
      bloc: userBloc,
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: flavor.text,
            ),
          );
        } else if (state is UserLoaded) {
          return UserDetails(user: state.user);
        } else if (state is UserError) {
          final flavor = Provider.of<Flavor>(context);
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: flavor.red, size: 48),
                const SizedBox(height: 8),
                Text(
                  state.error,
                  style: TextStyle(color: flavor.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                if (userBloc is UserBloc)
                  ElevatedButton(
                    onPressed: () {
                      userBloc.add(FetchProfileRequested());
                    },
                    child: const Text('Retry'),
                  )
              ],
            ),
          );
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
        const SizedBox(height: 16),
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
        const SizedBox(height: 16),
        ModalButton(
          title: 'Skills',
          icon: Icons.lightbulb_outline,
          modal: SkillsBottomSheet(skills: user.getAllSkills()),
        ),
        const SizedBox(height: 16),
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
            radius: 42,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  user.displayName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  softWrap: true,
                ),
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
        const SizedBox(width: 20),
        _buildChip(label: 'Location: $location', flavor: flavor),
      ],
    );
  }

  Widget _buildChip({required String label, required Flavor flavor}) {
    return Chip(
      backgroundColor: flavor.mantle,
      label: Text(
        label,
        style: const TextStyle(fontSize: 14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
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
    final currentCursus = user.getMainCursus();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderRow(currentCursus.cursus.name, currentCursus.grade ?? 'N/A', user.isStaff, flavor),
            const SizedBox(height: 16),
            _buildProgressBar(currentCursus.level, flavor),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.assessment_outlined, 'Evaluation Points:', '${user.evaluationPoints}', flavor),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.account_balance_wallet_outlined, 'Wallet Balance:', '\$${user.wallet}', flavor),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.pool_outlined, 'Pool:', '${user.poolMonth} ${user.poolYear}', flavor),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(String cursusName, String grade, bool isStaff, Flavor flavor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cursusName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 48),
        isStaff
            ? Text(
                'Staff',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: flavor.peach),
              )
            : Text(
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
            color: flavor.mauve.withOpacity(0.7),
            backgroundColor: flavor.lavender.withOpacity(.2),
            minHeight: 20,
          ),
        ),
        Text(
          'Level ${level.toStringAsFixed(2)}',
          style: TextStyle(color: flavor.text, fontWeight: FontWeight.bold),
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
