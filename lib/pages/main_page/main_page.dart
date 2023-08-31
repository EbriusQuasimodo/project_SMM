import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CallsListModel> callsListModel = [];
  DateFormat dateFormat = DateFormat.yMd('ru');
  DateFormat timeFormat = DateFormat.Hm('ru');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: AppBar(
            title: Text(AppLocalizations.of(context)!.mainPage),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: ThemeApp.secondaryColorTextAndIcons,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
                height: 36,
                child: Row(
                  children: [
                    Expanded(
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/icons/shared/phone.svg'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text('Вызовы'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Badge(
                                    badgeStyle: BadgeStyle(
                                      shape: BadgeShape.square,
                                      borderRadius: BorderRadius.circular(12),
                                      badgeColor: ThemeApp.primaryColor,
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6, top: 3, bottom: 3),
                                      elevation: 0,
                                    ),
                                    badgeContent: Text(
                                      '${callsListModel.length}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: ThemeApp.whiteColor),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                    Expanded(
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/icons/shared/car.svg'),
                                  const Text('Бригады'),
                                ],
                              ),
                            ))),
                  ],
                ),
              ),
              BlocBuilder<MainPageBloc, MainPageState>(
                builder: (context, state) {
                  if (state is MainPageLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MainPageLogoutState) {
                    LocalStorage.setString(AppConstants.TOKEN, '');
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.auth, (route) => false);
                  } else if (state is MainPageFailedState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is MainPageDoneState) {
                    callsListModel = state.calls;

                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 16,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.calls.length,
                          itemBuilder: (BuildContext context, int index) {
                            DateTime parsedDate = DateTime.parse(state
                                .calls[index].receiptDate
                                .replaceAll('T', ' ')
                                .toString());
                            var utcDate = dateFormat
                                .format(parsedDate); // pass the UTC time here
                            var localDate = dateFormat
                                .parse(utcDate, true)
                                .toLocal()
                                .toString();
                            var utcTime = timeFormat
                                .format(parsedDate); // pass the UTC time here
                            var localTime = timeFormat
                                .parse(utcTime, true)
                                .toLocal()
                                .toString();
                            String receiptDate =
                                dateFormat.format(DateTime.parse(localDate));
                            String receiptTime =
                                timeFormat.format(DateTime.parse(localTime));
                            return Container(
                              margin: const EdgeInsets.only(
                                  right: 16, left: 16, top: 4, bottom: 4),
                              decoration: const BoxDecoration(
                                  color: ThemeApp.backgroundColorOne),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        right: 12, left: 12),
                                    child: Text(
                                      'Вызов 2345',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              ThemeApp.bodyColorTextAndIcons),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12, left: 12),
                                    child: Text(
                                      '$receiptDate  $receiptTime',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeApp
                                              .secondaryColorTextAndIcons),
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
                                    padding: const EdgeInsets.only(
                                        right: 12, left: 12),
                                    child: Text(
                                      state.calls[index].reason!.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ThemeApp.secondaryColorTextAndIcons),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12, left: 12),
                                    child: Text(
                                      '${state.calls[index].street} ${state.calls[index].house}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ThemeApp.secondaryColorTextAndIcons),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ));
  }
}
