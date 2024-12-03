import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onSearch;
  final VoidCallback onClear;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSearch,
    required this.onClear,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);

    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: flavor.surface0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: flavor.text.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              cursorColor: flavor.text,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: flavor.surface2),
                counterText: '',
              ),
              style: TextStyle(color: flavor.text),
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              onSubmitted: (query) {
                widget.onSearch(query.trim());
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, size: 20, color: flavor.text),
            onPressed: () {
              widget.focusNode.unfocus();
              widget.onSearch(widget.controller.text.trim());
            },
          )
        ],
      ),
    );
  }
}
