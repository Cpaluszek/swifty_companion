import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/core/model/cursus_users_model.dart';
import 'package:swifty_companion/core/model/project_users_model.dart';

class ProjectsBottomSheet extends StatelessWidget {
  final List<ProjectUsersModel> projects;
  final List<CursusUsersModel> cursus;

  const ProjectsBottomSheet({super.key, required this.projects, required this.cursus});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);

    final Map<int, List<ProjectUsersModel>> groupedProject = _groupProjectsByCursusId(projects);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: ListView(
        children: groupedProject.entries.map(
          (entry) {
            final cursusId = entry.key;
            final projectList = entry.value;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(color: flavor.base, borderRadius: BorderRadius.circular(12), boxShadow: [
                BoxShadow(
                  color: flavor.crust.withOpacity(0.1),
                  blurRadius: 4,
                ),
              ]),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: flavor.surface0,
                  child: Icon(_getCursusIcon(cursusId), color: flavor.text),
                ),
                collapsedBackgroundColor: Colors.transparent,
                backgroundColor: flavor.base,
                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                iconColor: flavor.text,
                title: Text(
                  _getCursusName(cursus, cursusId),
                  style: TextStyle(color: flavor.text, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                children: projectList.map((project) => _buildProjectTile(context, project, flavor)).toList(),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Map<int, List<ProjectUsersModel>> _groupProjectsByCursusId(List<ProjectUsersModel> projects) {
    final Map<int, List<ProjectUsersModel>> groupedProjects = {};
    for (var project in projects) {
      if (groupedProjects.containsKey(project.cursusIds.first)) {
        groupedProjects[project.cursusIds.first]!.add(project);
      } else {
        groupedProjects[project.cursusIds.first] = [project];
      }
    }
    return groupedProjects;
  }

  String _getCursusName(List<CursusUsersModel> cursus, int cursusId) {
    return cursus.firstWhere((cursus) => cursus.cursus.id == cursusId).cursus.name;
  }

  IconData _getCursusIcon(int cursusId) {
    if (cursusId == 9) {
      return Icons.pool;
    }
    return Icons.school;
  }

  Widget _buildProjectTile(BuildContext context, ProjectUsersModel project, Flavor flavor) {
    const int maxChars = 36;
    String projectName = project.project.name;
    if (projectName.length > maxChars) {
      projectName = '${projectName.substring(0, maxChars)}...';
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: flavor.base,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: flavor.text.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: flavor.crust.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        title: Text(
          projectName.trim(),
          style: TextStyle(color: flavor.text, fontWeight: FontWeight.bold, fontSize: 14),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: project.finalMark != null
            ? Text(
                '${project.finalMark}',
                style: TextStyle(color: flavor.text.withOpacity(0.8), fontSize: 12),
              )
            : null,
        trailing: getIcon(project, flavor),
        dense: true,
        visualDensity: VisualDensity.compact,
      ),
    );
  }

  Icon getIcon(ProjectUsersModel project, Flavor flavor) {
    if (project.status == 'finished') {
      if (project.isValidated == true) {
        return Icon(Icons.done, color: flavor.green);
      }
      return Icon(Icons.close, color: flavor.red);
    }
    if (project.status == 'in_progress') {
      return Icon(Icons.timelapse, color: flavor.blue);
    }
    if (project.status == 'searching_a_group') {
      return Icon(Icons.person_search, color: flavor.yellow);
    }
    return Icon(Icons.indeterminate_check_box, color: flavor.text);
  }
}
