import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/core/model/skill_model.dart';
import 'package:swifty_companion/modules/home_screen/widget/scrollable_modal_bottom_sheet.dart';

class SkillsBottomSheet extends StatelessWidget {
  final List<SkillModel> skills;

  const SkillsBottomSheet({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);

    return ScrollableModalBottomSheet<SkillModel>(
      items: skills,
      emptyMessage: 'No Skills Found',
      itemBuilder: (context, skill) => _buildSkillTile(context, skill, flavor),
    );
  }

  Widget _buildSkillTile(BuildContext context, SkillModel skill, Flavor flavor) {
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
          skill.name,
          style: TextStyle(color: flavor.text, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Level: ${(skill.level).toStringAsFixed(2)}',
          style: TextStyle(color: flavor.text.withOpacity(0.7)),
        ),
      ),
    );
  }
}
