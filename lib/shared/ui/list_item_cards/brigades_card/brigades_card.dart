import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/statuses/brigades_statuses.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/list_item_cards/date_text.dart';
import 'package:project_smm/shared/ui/list_item_cards/status_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/text_with_icon.dart';
import 'package:project_smm/shared/ui/list_item_cards/title_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrigadesCard extends StatefulWidget {
  final BrigadesListModel? brigadesInfo;
  final VoidCallback onTapFavouriteButton;
  final bool isFavouritePage;
  final int index;
  final int? dayNumber;

  const BrigadesCard({
    super.key,
    required this.brigadesInfo,
    required this.onTapFavouriteButton,
    required this.isFavouritePage,
    required this.index,
    required this.dayNumber,
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
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    checkBrigadesStatus();
  }

  void checkBrigadesStatus() {
    if (widget.brigadesInfo!.status == BrigadesStatuses().waitingDeparture) {
      statusName = AppLocalizations.of(context)!.waitingDeparture;
      statusColor = ThemeApp.onTheWayWaitColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().arrival) {
      statusName = AppLocalizations.of(context)!.arrival;
      statusColor = ThemeApp.arrivalColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().service) {
      statusName = AppLocalizations.of(context)!.service;
      statusColor = ThemeApp.onServiceColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().hospitalization) {
      statusName = AppLocalizations.of(context)!.hospitalization; //доезд
      statusColor = ThemeApp.hospitalizationColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().inHospital) {
      statusName = AppLocalizations.of(context)!.inHospital;
      statusColor = ThemeApp.inHospitalColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().returnToPS) {
      statusName = AppLocalizations.of(context)!.returnToPS;
      statusColor = ThemeApp.returnToPSColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().onPS) {
      statusName = AppLocalizations.of(context)!.onPS; //на пс
      statusColor = ThemeApp.onPSColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().brigadeIsFree) {
      statusName = AppLocalizations.of(context)!.free;
      statusColor = ThemeApp.brigadeFreeColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().obligatedReturn) {
      statusName = AppLocalizations.of(context)!.obligatedReturn;
      statusColor = ThemeApp.mandatoryReturnToPSColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().lunch) {
      statusName = AppLocalizations.of(context)!.brigadeBreak;
      statusColor = ThemeApp.lunchColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().refueling) {
      statusName = AppLocalizations.of(context)!.refueling;
      statusColor = ThemeApp.refuelingColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().repair) {
      statusName = AppLocalizations.of(context)!.repair;
      statusColor = ThemeApp.repairColor;
    }
    if (widget.brigadesInfo!.status == BrigadesStatuses().preparation) {
      statusName = AppLocalizations.of(context)!.preparation;
      statusColor = ThemeApp.preparationColor;
    }
  }

  void parseDate() {
    DateTime parsedDate = DateTime.parse(widget.brigadesInfo!.statusStartTime !=
            null
        ? widget.brigadesInfo!.statusStartTime!.replaceAll('T', ' ').toString()
        : widget.brigadesInfo!.shiftStart.replaceAll('T', ' ').toString());
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
                  TitleText(
                      text:
                          '${AppLocalizations.of(context)!.brigade} ${widget.brigadesInfo!.brigade!.number}'),
                  const SizedBox(
                    height: 6,
                  ),
                  DateText(
                      dateText: statusStartDate, timeText: statusStartTime),
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
                  'assets/images/icons/shared/icon_profile.svg',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    widget.brigadesInfo!.leader!.fio!,
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
          Container(
            padding: const EdgeInsets.only(right: 12, bottom: 12, top: 6),
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
                    TextWithIcon(
                      textColor: widget.dayNumber != null ?ThemeApp.secondaryColorTextAndIcons :ThemeApp.queueColor,
                        iconPath: widget.dayNumber != null ?'assets/images/icons/shared/call_grey.svg' :'assets/images/icons/shared/call_red.svg',
                        text: '${widget.dayNumber ?? 'не назначен'}'),
                    const SizedBox(
                      height: 6,
                    ),
                    TextWithIcon(
                        textColor: ThemeApp.secondaryColorTextAndIcons,
                        iconPath: 'assets/images/icons/shared/location.svg',
                        text:
                            '${LocalStorage.getString(AppConstants.LOCALE) == 'ru' || LocalStorage.getString(AppConstants.LOCALE) == '' ? widget.brigadesInfo!.substation!.name : widget.brigadesInfo!.substation!.nameAdd}'),
                  ],
                ),
                const Spacer(),
                MaterialButton(
                    onPressed: () {
                      widget.onTapFavouriteButton();
                    },
                    child: SvgPicture.asset(widget.isFavouritePage
                        ? 'assets/images/icons/shared/favourite.svg'
                        : widget.brigadesInfo!.isFavorite!
                            ? 'assets/images/icons/shared/favourite.svg'
                            : 'assets/images/icons/shared/unfavourite.svg'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
