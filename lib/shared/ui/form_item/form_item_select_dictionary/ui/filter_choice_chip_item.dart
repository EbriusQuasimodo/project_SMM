import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class FilterChipItem extends StatefulWidget {
  final String? itemName;
  final int? itemId;
  final List<int> filters;
  final VoidCallback onCityChoice;
  final List<String>? substationsName;
  const FilterChipItem({super.key,required this.onCityChoice, required this.itemName, required this.itemId, required this.filters, this.substationsName,});

  @override
  State<FilterChipItem> createState() => _FilterChipItemState();
}

class _FilterChipItemState extends State<FilterChipItem> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.itemName!),
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: widget.filters.contains(widget.itemId) ? ThemeApp.whiteColor : ThemeApp.primaryColor),
      selected: widget.filters.contains(widget.itemId),
      selectedColor: ThemeApp.primaryColor,
      backgroundColor: ThemeApp.backgroundColorOne,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ThemeApp.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      showCheckmark: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      onSelected: (bool value) {
        setState(() {
          if (value) {
            if (!widget.filters.contains(widget.itemId)) {
              widget.filters.add(widget.itemId!);
              widget.substationsName?.add(widget.itemName!);
              widget.onCityChoice();
            }
          } else {
            widget.filters.removeWhere((int id) {
              return id == widget.itemId;
            });
            widget.substationsName?.removeWhere((String name){
              return name == widget.itemName!;
            });
            widget.onCityChoice();
          }

        });
      },


    );
  }
}
