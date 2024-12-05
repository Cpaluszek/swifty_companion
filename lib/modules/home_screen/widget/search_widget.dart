import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onSearch;
  final VoidCallback onClear;
  final bool isLoading;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSearch,
    required this.onClear,
    required this.isLoading,
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

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
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
                  enabled: !widget.isLoading,
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  onSubmitted: widget.isLoading
                      ? null
                      : (query) {
                          FocusScope.of(context).unfocus();
                          widget.onSearch(query.trim());
                        },
                ),
              ),
              widget.isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(flavor.red),
                          backgroundColor: flavor.surface2,
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.search, size: 20, color: flavor.text),
                      onPressed: widget.controller.text.isEmpty || widget.isLoading
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              widget.onSearch(widget.controller.text.trim());
                            },
                    )
            ],
          ),
        ),
        if (widget.isLoading)
          Positioned.fill(
            child: Container(
              color: flavor.crust.withOpacity(0.4),
            ),
          ),
      ],
    );
  }
}
