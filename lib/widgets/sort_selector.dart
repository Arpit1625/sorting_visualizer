import 'package:flutter/material.dart';

class SortSelector extends StatelessWidget {
  final String selectedSort;
  final ValueChanged<String> onSortSelected;

  const SortSelector({
    Key? key,
    required this.selectedSort,
    required this.onSortSelected,
  }) : super(key: key);

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Selection Sort', 'Bubble Sort', 'Insertion Sort', 'Merge Sort', 'Quick Sort']
              .map((sort) => ListTile(
                    title: Text(sort),
                    onTap: () {
                      onSortSelected(sort);
                      Navigator.pop(context);
                    },
                  ))
              .toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showSortOptions(context),
      child: Text('Select Sort: $selectedSort'),
    );
  }
}
