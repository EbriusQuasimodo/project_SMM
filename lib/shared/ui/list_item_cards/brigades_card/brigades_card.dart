import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/shared/lib/statuses/brigades_statuses.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/list_item_cards/date_text.dart';
import 'package:project_smm/shared/ui/list_item_cards/status_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/text_with_icon.dart';
import 'package:project_smm/shared/ui/list_item_cards/title_text.dart';

class BrigadesCard extends StatefulWidget {
  final BrigadesListModel? brigadesInfo;

  const BrigadesCard({
    super.key,
    required this.brigadesInfo,
  });

  @override
  State<BrigadesCard> createState() => _BrigadesCardState();
}

class _BrigadesCardState extends State<BrigadesCard> {
  String statusStartDate = '';

  String statusStartTime = '';

  DateFormat dateFormat = DateFormat.yMd('ru');

  DateFormat timeFormat = DateFormat.Hm('ru');
  String statusName = '';
  late Color statusColor;
  @override
  void initState() {
    super.initState();
    parseDate();
    checkBrigadesStatus();
  }
  void checkBrigadesStatus() {
    if (widget.brigadesInfo!.status == BrigadesStatuses().waitingDeparture) {
      statusName = 'Ожидает выезда';
      statusColor = ThemeApp.onTheWayWaitColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().arrival) {
      statusName = 'В пути';
      statusColor = ThemeApp.arrivalColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().service) {
      statusName = 'Обслуживание';
      statusColor = ThemeApp.onServiceColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().hospitalization) {
      statusName = 'Транспортировка'; //доезд
      statusColor = ThemeApp.transportationColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().inHospital) {
      statusName = 'В стационаре';
      statusColor = ThemeApp.inHospitalColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().returnToPS) {
      statusName = 'Возвращение на пс';
      statusColor = ThemeApp.returnToPSColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().onPS) {
      statusName = 'На пс';
      statusColor = ThemeApp.onPSColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().brigadeIsFree) {
      statusName = 'Свободна';
      statusColor = ThemeApp.brigadeFreeColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().mandatoryReturnToPS) {
      statusName = 'Обязат возвращение';
      statusColor = ThemeApp.mandatoryReturnToPSColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().lunch) {
      statusName = 'Обед';
      statusColor = ThemeApp.lunchColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().refueling) {
      statusName = 'Заправка';
      statusColor = ThemeApp.refuelingColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().repair) {
      statusName = 'Ремонт';
      statusColor = ThemeApp.repairColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().preparation) {
      statusName = 'Подготовка';
      statusColor = ThemeApp.preparationColor;
    }
  }
  void parseDate() {
    DateTime parsedDate = DateTime.parse(
        widget.brigadesInfo!.statusStartTime.replaceAll('T', ' ').toString());
    var utcDate = dateFormat.format(parsedDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
    var utcTime = timeFormat.format(parsedDate); // pass the UTC time here
    var localTime = timeFormat.parse(utcTime, true).toLocal().toString();
    statusStartDate = dateFormat.format(DateTime.parse(localDate));
    statusStartTime = timeFormat.format(DateTime.parse(localTime));
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
                  TitleText(text: 'Бригада ${widget.brigadesInfo!.id}'), const SizedBox(
                    height: 6,
                  ),
                  DateText(dateText: statusStartDate, timeText: statusStartTime),
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
          TextWithIcon(
              iconPath: 'assets/images/icons/shared/icon_profile.svg',
              text: widget.brigadesInfo!.leader!.fio!),
          const SizedBox(
            height: 6,
          ),
          Container(
            padding:
                const EdgeInsets.only(right: 12, bottom: 12, top: 6),
            decoration: const BoxDecoration(
                color: ThemeApp.elevationColorOne,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWithIcon(
                        iconPath: 'assets/images/icons/shared/call_grey.svg',
                        text: '1234'),
                    const SizedBox(
                      height: 6,
                    ),
                    TextWithIcon(
                        iconPath: 'assets/images/icons/shared/location.svg',
                        text: '${widget.brigadesInfo!.substation!.name}'),
                  ],
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
