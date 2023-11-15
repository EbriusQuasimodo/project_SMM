import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/statuses/calls_statuses.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/list_item_cards/date_text.dart';
import 'package:project_smm/shared/ui/list_item_cards/status_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/text_with_icon.dart';
import 'package:project_smm/shared/ui/list_item_cards/title_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CallsCard extends StatefulWidget {
  final CallsListModel? callsInfo;
  final VoidCallback onTapFavouriteButton;
  final bool isFavouritePage;

  const CallsCard(
      {super.key,
      required this.callsInfo,
      required this.onTapFavouriteButton,
      required this.isFavouritePage});

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
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    checkCallStatus();
  }

  void checkCallStatus() {
    if (widget.callsInfo!.status == CallStatuses().created) {
      statusName = AppLocalizations.of(context)!.created; //создан
      statusColor = ThemeApp.primaryColor;
    }
    if (widget.callsInfo!.status == CallStatuses().inQueue) {
      statusName = AppLocalizations.of(context)!.inQueue; // в очереди
      statusColor = ThemeApp.queueColor;
    }
    if (widget.callsInfo!.status == CallStatuses().waitingDeparture) {
      statusName =
          AppLocalizations.of(context)!.waitingDeparture; //ожидание выезда
      statusColor = ThemeApp.onTheWayWaitColor;
    }
    if (widget.callsInfo!.status == CallStatuses().arrival) {
      statusName = AppLocalizations.of(context)!.transit; //доезд (в пути?)
      statusColor = ThemeApp.arrivalColor;
    }
    if (widget.callsInfo!.status == CallStatuses().service) {
      statusName = AppLocalizations.of(context)!.service; // обслуживание
      statusColor = ThemeApp.onServiceColor;
    }
    if (widget.callsInfo!.status == CallStatuses().onHospitalization) {
      statusName =
          AppLocalizations.of(context)!.hospitalization; // транспортировка
      statusColor = ThemeApp.hospitalizationColor;
    }
    if (widget.callsInfo!.status == CallStatuses().arrivalAtHospital) {
      statusName = AppLocalizations.of(context)!.inHospital; // стационар
      statusColor = ThemeApp.inHospitalColor;
    }
    if (widget.callsInfo!.status == CallStatuses().onResult) {
      statusName = AppLocalizations.of(context)!.onResult; // завершено
      statusColor = ThemeApp.onResultColor;
    }
    if (widget.callsInfo!.status == CallStatuses().inArchive) {
      statusName = AppLocalizations.of(context)!.archive; // закрыт
      statusColor = ThemeApp.inArchiveColor;
    }
    if (widget.callsInfo!.status == CallStatuses().postponed) {
      statusName = AppLocalizations.of(context)!.postponed; //отложен
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
                  TitleText(
                      text:
                          '${AppLocalizations.of(context)!.call} ${widget.callsInfo!.dayNumber}'),
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
                    LocalStorage.getString(AppConstants.LOCALE) == 'ru' || LocalStorage.getString(AppConstants.LOCALE) == ''
                        ? 'код вызова: ${widget.callsInfo!.reason!.code}, ${widget.callsInfo!.reason!.name}'
                        : 'код вызова: ${widget.callsInfo!.reason!.code}, ${widget.callsInfo!.reason!.nameAdd}',
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
            textColor: ThemeApp.secondaryColorTextAndIcons,
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
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                TextWithIcon(
                  textColor: widget.callsInfo!.dutyOutfit?.brigade?.number != null ?ThemeApp.secondaryColorTextAndIcons : ThemeApp.queueColor,
                  iconPath: widget.callsInfo!.dutyOutfit?.brigade?.number != null ?'assets/images/icons/shared/car_grey.svg' :'assets/images/icons/shared/car_red.svg',
                  text: '${widget.callsInfo!.dutyOutfit?.brigade?.number ?? 'не назначено'}',
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    widget.onTapFavouriteButton();
                  },
                  child: SvgPicture.asset(widget.isFavouritePage
                      ? 'assets/images/icons/shared/favourite.svg'
                      : widget.callsInfo!.isFavorite!
                          ? 'assets/images/icons/shared/favourite.svg'
                          : 'assets/images/icons/shared/unfavourite.svg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
