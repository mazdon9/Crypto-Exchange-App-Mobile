import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SelectionBottomSheet extends StatelessWidget {
  final String title;
  final List<String> items;
  final String selectedItem;
  final Function(String) onItemSelected;

  const SelectionBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: _getHeight(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    items[index],
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    onItemSelected(items[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required List<String> items,
    required String selectedItem,
    required Function(String) onItemSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.colorScheme.surface,
      builder: (context) => SelectionBottomSheet(
        title: title,
        items: items,
        selectedItem: selectedItem,
        onItemSelected: onItemSelected,
      ),
    );
  }
}
