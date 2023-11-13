
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/entities/favourites_entities/favourites_bloc/favourites_bloc.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/widgets/favorites_page_widgets/favorites_page_body.dart';

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
  String profileList = '';

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
                          isCall: isCall, searchModel: searchModel);
                    },
                  ),
                ).then((value) {
                  searchModel = value;
                  _bloc.add(FavouritesPageStartLoadingEvent(
                      shouldLoadMore: false, searchModel: searchModel));
                });
              },
              icon: const Icon(
                Icons.search,
                color: ThemeApp.secondaryColorTextAndIcons,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
          create: (context) => _bloc,
          child: RefreshIndicator(
              onRefresh: () async {
                searchModel = null;
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
