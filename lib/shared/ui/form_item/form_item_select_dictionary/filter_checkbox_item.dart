import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class FilterCheckboxItem extends StatefulWidget {
  final String? itemName;
  final int? itemId;
  final List<int> filters;

  const FilterCheckboxItem(
      {super.key,
      required this.filters,
      required this.itemName,
      required this.itemId});

  @override
  State<FilterCheckboxItem> createState() => _FilterCheckboxItemState();
}

class _FilterCheckboxItemState extends State<FilterCheckboxItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: widget.filters.contains(widget.itemId!),
      onTap: () {
        setState(() {
          if (!widget.filters.contains(widget.itemId!)) {
            widget.filters.add(widget.itemId!);
          } else {
            widget.filters.removeWhere((int id) {
              return id == widget.itemId!;
            });
          }
        });
      },
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(widget.filters.contains(widget.itemId!)
                ? 'assets/images/icons/shared/check_box_checked.svg'
                : 'assets/images/icons/shared/check_box_unchecked.svg'),
          ),
          Text(widget.itemName!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeApp.secondaryColorTextAndIcons)),
        ],
      ),
    );
  }
}
