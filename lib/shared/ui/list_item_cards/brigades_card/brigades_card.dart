import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/list_item_cards/date_text/date_text.dart';
import 'package:project_smm/shared/ui/list_item_cards/text_with_icon/text_with_icon.dart';
import 'package:project_smm/shared/ui/list_item_cards/title_text/title_text.dart';

class BrigadesCard extends StatefulWidget {
  final BrigadesListModel brigadesInfo;

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

  @override
  void initState() {
    super.initState();
    parseDate();
  }

  void parseDate() {
    DateTime parsedDate = DateTime.parse(
        widget.brigadesInfo.statusStartTime.replaceAll('T', ' ').toString());
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
          TitleText(text: 'Бригада ${widget.brigadesInfo.id}'),
          const SizedBox(
            height: 6,
          ),
          DateText(dateText: statusStartDate, timeText: statusStartTime),
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
          TextWithIcon(
              iconPath: 'assets/images/icons/shared/icon_profile.svg',
              text: widget.brigadesInfo.leader!.fio!),
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
                        text: '${widget.brigadesInfo.substation!.name}'),
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
