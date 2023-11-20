import 'package:flutter/material.dart';
import 'package:project_smm/entities/reports_entities/types/structure_report_table.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class TableRowItem extends StatefulWidget {
  final StructureReportTable rowReportData;
  final int index;

  const TableRowItem({super.key, required this.rowReportData, required this.index});

  @override
  State<TableRowItem> createState() => _TableRowItemState();
}

class _TableRowItemState extends State<TableRowItem> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: widget.index % 2 != 0
              ? ThemeApp.dividerOneColor
              : ThemeApp.whiteColor),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: widget.rowReportData.isSubparagraph ? 24 : 12),
            width: MediaQuery.of(context).size.width - 248,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: ThemeApp.dividerTwoColor,
                width: 1,
              ),
            ),
            child: Text(widget.rowReportData.data,
                style: TextStyle(
                    fontSize: widget.rowReportData.isSubparagraph ? 12 : 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeApp.bodyColorTextAndIcons)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            width: 72,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
              color: ThemeApp.dividerTwoColor,
              width: 1,
            )),
            child: Text('${widget.rowReportData.yesterdayValue}',
                style: TextStyle(
                    fontSize: widget.rowReportData.isSubparagraph ? 12 : 14,
                    fontWeight: FontWeight.w400,
                    color: ThemeApp.bodyColorTextAndIcons)),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                width: 72,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: ThemeApp.dividerTwoColor,
                  width: 1,
                )),
                child: Text('${widget.rowReportData.todayValue}',
                    style: TextStyle(
                        fontSize: widget.rowReportData.isSubparagraph ? 12 : 14,
                        fontWeight: FontWeight.w400,
                        color: ThemeApp.bodyColorTextAndIcons)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                width: 72,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: ThemeApp.dividerTwoColor,
                  width: 1,
                )),
                child: Text(
                  '${widget.rowReportData.todayPercent.toInt()}%',
                  style: TextStyle(
                      fontSize: widget.rowReportData.isSubparagraph ? 12 : 14,
                      fontWeight: FontWeight.w400,
                      color: ThemeApp.bodyColorTextAndIcons),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
