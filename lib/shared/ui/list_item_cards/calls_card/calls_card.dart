import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/shared/lib/statuses/calls_statuses.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/list_item_cards/date_text.dart';
import 'package:project_smm/shared/ui/list_item_cards/status_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/text_with_icon.dart';
import 'package:project_smm/shared/ui/list_item_cards/title_text.dart';

class CallsCard extends StatefulWidget {
  final CallsListModel? callsInfo;

  const CallsCard({
    super.key,
    required this.callsInfo,
  });

  @override
  State<CallsCard> createState() => _CallsCardState();
}

class _CallsCardState extends State<CallsCard> {
  String receiptDate = '';

  String receiptTime = '';

  DateFormat dateFormat = DateFormat.yMd('ru');

  DateFormat timeFormat = DateFormat.Hm('ru');
  String statusName = '';
  late Color statusColor;

  @override
  void initState() {
    super.initState();
    parseDate();
    checkCallStatus();
  }

  void checkCallStatus() {
    if (widget.callsInfo!.status == CallStatuses().created) {
      statusName = 'Создан';
      statusColor = ThemeApp.primaryColor;
    }
    if (widget.callsInfo!.status == CallStatuses().inQueue) {
      statusName = 'В очереди';
      statusColor = ThemeApp.queueColor;
    }
    if (widget.callsInfo!.status == CallStatuses().waitingDeparture) {
      statusName = 'Ожидает выезда';
      statusColor = ThemeApp.onTheWayWaitColor;
    }
    if (widget.callsInfo!.status == CallStatuses().arrival) {
      statusName = 'В пути'; //доезд
      statusColor = ThemeApp.arrivalColor;
    }
    if (widget.callsInfo!.status == CallStatuses().service) {
      statusName = 'Обслуживание';
      statusColor = ThemeApp.onServiceColor;
    }
    if (widget.callsInfo!.status == CallStatuses().onHospitalization) {
      statusName = 'Транспортировка';
      statusColor = ThemeApp.transportationColor;
    }
    if (widget.callsInfo!.status == CallStatuses().arrivalAtHospital) {
      statusName = 'В стационаре';
      statusColor = ThemeApp.inHospitalColor;
    }
    if (widget.callsInfo!.status == CallStatuses().onResult) {
      statusName = 'На результате';
      statusColor = ThemeApp.onResultColor;
    }
    if (widget.callsInfo!.status == CallStatuses().inArchive) {
      statusName = 'Архив';
      statusColor = ThemeApp.inArchiveColor;
    }
    if (widget.callsInfo!.status == CallStatuses().postponed) {
      statusName = 'Отложен';
      statusColor = ThemeApp.primaryColor;
    }
  }

  void parseDate() {
    DateTime parsedDate = DateTime.parse(
        widget.callsInfo!.receiptDate.replaceAll('T', ' ').toString());
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
      decoration: BoxDecoration(
        color: ThemeApp.backgroundColorOne,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(text: 'Вызов ${widget.callsInfo!.id}'),
                  const SizedBox(
                    height: 6,
                  ),
                  DateText(
                    dateText: receiptDate,
                    timeText: receiptTime,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
              const Spacer(),
              StatusCard(statusName: statusName, statusColor: statusColor),
            ],
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
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/icons/shared/reason.svg',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    widget.callsInfo!.reason!.name,
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
          ),
          const SizedBox(
            height: 6,
          ),
          TextWithIcon(
            iconPath: 'assets/images/icons/shared/location.svg',
            text: '${widget.callsInfo!.street} ${widget.callsInfo!.house}',
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            padding: const EdgeInsets.only(right: 12, bottom: 12, top: 6),
            decoration: const BoxDecoration(
                color: ThemeApp.elevationColorOne,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Row(
              children: [
                const TextWithIcon(
                  iconPath: 'assets/images/icons/shared/car_grey.svg',
                  text: '123 У',
                ),
                const Spacer(),
                SvgPicture.asset('assets/images/icons/shared/favourite.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
