import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/favourites_entities/favourites_bloc/favourites_bloc.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/pages/filter_page/filter_choice_chip_page.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/widgets/favorites_page_widgets/favorites_page_body.dart';
import 'package:provider/provider.dart';

import 'search_page.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  bool isCall = true;
  late final FavouritesBloc _bloc = FavouritesBloc()
    ..add(FavouritesPageStartLoadingEvent(
      shouldLoadMore: false,
    ));
  SearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Text(AppLocalizations.of(context)!.favoritesPage),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SearchPage(
                        isCall: isCall,
                        searchModel: searchModel ?? SearchModel(),
                      );
                    },
                  ),
                ).then((value) {

                  searchModel = value;
                  print (searchModel!.numberCalls);
                  _bloc
                      .add(FavouritesPageStartLoadingEvent(
                      shouldLoadMore: false,
                      searchModel: searchModel));
                });
              },
              icon: const Icon(
                Icons.search,
                color: ThemeApp.secondaryColorTextAndIcons,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Provider(
                        create: (context) =>
                            FiltersBloc()..add(FiltersStartLoadingEvent()),
                        child: FilterChoiceChipPage(
                          fromWhereOpen: AppRoutes.mainPage,
                          isCall: isCall,
                        ),
                      );
                    },
                  ),
                ).then((value) => setState(() {}));
              },
              icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
            )
          ],
        ),
      ),
      body: BlocProvider(
          create: (context) => _bloc,
          child: RefreshIndicator(
              onRefresh: () async {
                _bloc.add(FavouritesPageStartLoadingEvent(
                  shouldLoadMore: false,
                  searchModel: null,
                ));
              },
              child: FavouritesPageBodyWidget(
                onTapCallButton: () {
                  setState(() {
                    isCall = true;
                  });
                },
                onTapBrigadeButton: () {
                  setState(() {
                    isCall = false;
                  });
                },
                isCall: isCall,
              ))),
    );
  }
}
