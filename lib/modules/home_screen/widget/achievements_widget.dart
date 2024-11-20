import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/core/model/achievement_model.dart';

class AchievementsWidget extends StatelessWidget {
  final List<AchievementModel> achievements;

  const AchievementsWidget({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];
          return Container(
            color: flavor.base,
            margin: const EdgeInsets.fromLTRB(7, 2, 7, 2),
            child: ListTile(
              title: Text(achievement.name),
              subtitle: Text(achievement.description),
              trailing: _achievementImage(achievement.name, achievement.image),
            ),
          );
        },
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
