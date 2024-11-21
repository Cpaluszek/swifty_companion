import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScrollableModalBottomSheet<T> extends StatelessWidget {
  final List<T> items;
  final String emptyMessage;
  final Widget Function(BuildContext context, T item) itemBuilder;

  const ScrollableModalBottomSheet({
    super.key,
    required this.items,
    required this.emptyMessage,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sentiment_dissatisfied, size: 48, color: flavor.text.withOpacity(0.6)),
            const SizedBox(height: 12),
            Text(
              emptyMessage,
              style: TextStyle(color: flavor.text, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          color: flavor.base,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: ListView.builder(
            controller: scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) => itemBuilder(context, items[index]),
          ),
        );
      },
    );
  }
}
