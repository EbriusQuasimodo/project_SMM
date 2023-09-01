import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class ListItemCard extends StatefulWidget {
  final CallsListModel? itemCallsInfo;
  final BrigadesListModel? itemBrigadesInfo;

  const ListItemCard({
    super.key,
    this.itemCallsInfo, this.itemBrigadesInfo,
  });

  @override
  State<ListItemCard> createState() => _ListItemCardState();
}

class _ListItemCardState extends State<ListItemCard> {
  String receiptDate = '';

  String receiptTime = '';

  DateFormat dateFormat = DateFormat.yMd('ru');

  DateFormat timeFormat = DateFormat.Hm('ru');

  @override
  void initState() {
    super.initState();
    parseDate();
  }

  void parseDate() {
    DateTime parsedDate = DateTime.parse(
        widget.itemCallsInfo!.receiptDate.replaceAll('T', ' ').toString());
    var utcDate = dateFormat.format(parsedDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
    var utcTime = timeFormat.format(parsedDate); // pass the UTC time here
    var localTime = timeFormat.parse(utcTime, true).toLocal().toString();
    receiptDate = dateFormat.format(DateTime.parse(localDate));
    receiptTime = timeFormat.format(DateTime.parse(localTime));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 4),
      decoration: const BoxDecoration(color: ThemeApp.backgroundColorOne),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12, left: 12),
            child: Text(
              'Вызов 2345',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeApp.bodyColorTextAndIcons),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Text(
              '$receiptDate  $receiptTime',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeApp.secondaryColorTextAndIcons),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            color: ThemeApp.dividerColor,
            height: 2,
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Text(
              widget.itemCallsInfo!.reason!.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeApp.secondaryColorTextAndIcons),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Text(
              '${widget.itemCallsInfo!.street} ${widget.itemCallsInfo!.house}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeApp.secondaryColorTextAndIcons),
            ),
          ),
        ],
      ),
    );
  }
}
