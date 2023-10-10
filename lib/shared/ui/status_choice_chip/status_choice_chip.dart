import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/data_source/types/statuses_model.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class StatusChoiceChip extends StatefulWidget {
  StatusesList statusesList;
  Color? colorCardSelected;
  Color? colorCardUnSelected;
  List<int> statusFilters;
  final bool isCall;
  StatusChoiceChip({super.key, required this.statusesList, required this.colorCardSelected, required this.colorCardUnSelected ,required this.statusFilters, required this.isCall});

  @override
  State<StatusChoiceChip> createState() => _StatusChoiceChipState();
}

class _StatusChoiceChipState extends State<StatusChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(
                left: 3, right: 3, top: 3, bottom: 3),
            child: FilterChip(
              visualDensity: const VisualDensity(
                  vertical: -4, horizontal: -4),
              materialTapTargetSize:
              MaterialTapTargetSize.shrinkWrap,
              label: Text(widget.statusesList.statusName),
              labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: widget.statusFilters.contains(widget.statusesList.statusId)
                      ? ThemeApp.whiteColor
                      : ThemeApp.bodyColorTextAndIcons),
              selected: widget.statusFilters.contains(widget.statusesList.statusId),
              selectedColor: widget.colorCardSelected,
              backgroundColor: widget.colorCardUnSelected ,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: widget.colorCardSelected!, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              showCheckmark: false,
              avatar: widget.statusFilters.contains(widget.statusesList.statusId)
                  ? SvgPicture.asset(
                  'assets/images/icons/shared/select_filter.svg')
                  : null,
              labelPadding: EdgeInsets.zero,
              checkmarkColor: ThemeApp.whiteColor,
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    if (!widget.statusFilters.contains(widget.statusesList.statusId
                    )) {
                      widget.statusFilters.clear();
                      widget.statusFilters.add(widget.statusesList.statusId!);
                      context.read<MainPageBloc>().add(
                          MainPageStartLoadingEvent(
                              shouldLoadMore: false,
                              callsStatus: widget.isCall ? widget.statusFilters
                                  .map((i) => i.toString())
                                  .toList() : [],
                              brigadesStatus: widget.isCall ? [] :
                              widget.statusFilters
                                  .map((i) => i.toString())
                                  .toList()));
                    }
                  } else {
                    widget.statusFilters.removeWhere((int id) {
                      return id ==
                          widget.statusesList.statusId;
                    });
                    widget.statusFilters.add(widget.isCall ? 666 : 667);
                    context.read<MainPageBloc>().add(
                        MainPageStartLoadingEvent(
                            shouldLoadMore: false,
                            callsStatus: widget.isCall ? widget.statusFilters
                                .map((i) => i.toString())
                                .toList() : [],
                            brigadesStatus: widget.isCall ? [] :
                            widget.statusFilters
                                .map((i) => i.toString())
                                .toList()));
                  }
                });
              },
            )
    );
  }
}
