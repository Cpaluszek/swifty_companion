import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/core/model/achievement_model.dart';
import 'package:swifty_companion/modules/home_screen/widget/scrollable_modal_bottom_sheet.dart';

class AchievementsModalBottomSheet extends StatelessWidget {
  final List<AchievementModel> achievements;

  const AchievementsModalBottomSheet({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);

    return ScrollableModalBottomSheet<AchievementModel>(
      items: achievements,
      emptyMessage: 'No Achievements Found',
      itemBuilder: (context, achievement) => _buildAchievementTile(context, achievement, flavor),
    );
  }

  Widget _buildAchievementTile(BuildContext context, AchievementModel achievement, Flavor flavor) {
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
          achievement.name,
          style: TextStyle(color: flavor.text, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          achievement.description,
          style: TextStyle(color: flavor.text.withOpacity(0.7)),
        ),
        trailing: _achievementImage(achievement.name, achievement.image),
      ),
    );
  }

  Widget _achievementImage(String name, String imageUrl) {
    final sanitizedUrl = imageUrl.replaceFirst('/uploads/', '');
    final finalUrl = 'https://cdn.intra.42.fr/$sanitizedUrl';

    return SvgPicture.network(
      finalUrl,
      semanticsLabel: name,
      placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(
        color: Colors.blue,
      ),
      height: 40,
      width: 40,
    );
  }
}
