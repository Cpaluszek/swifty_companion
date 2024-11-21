import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/core/model/project_users_model.dart';
import 'package:swifty_companion/modules/home_screen/widget/scrollable_modal_bottom_sheet.dart';

class ProjectsBottomSheet extends StatelessWidget {
  final List<ProjectUsersModel> projects;

  const ProjectsBottomSheet({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);

    return ScrollableModalBottomSheet<ProjectUsersModel>(
      items: projects,
      emptyMessage: 'No Achievements Found',
      itemBuilder: (context, achievement) => _buildProjectTile(context, achievement, flavor),
    );
  }

  Widget _buildProjectTile(BuildContext context, ProjectUsersModel project, Flavor flavor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: flavor.surface0,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: flavor.crust.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        tileColor: flavor.surface0,
        title: Text(
          project.project.name,
          style: TextStyle(color: flavor.text, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          project.status,
          style: TextStyle(color: flavor.text.withOpacity(0.7)),
        ),
      ),
    );
  }
}
