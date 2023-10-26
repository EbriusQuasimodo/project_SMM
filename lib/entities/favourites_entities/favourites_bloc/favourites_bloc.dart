
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/favourites_entities/favourites_api/repository/favourites_brigades_repository.dart';
import 'package:project_smm/entities/favourites_entities/favourites_api/repository/favourites_calls_repository.dart';
import 'package:project_smm/entities/favourites_entities/favourites_api/repository/favourites_delete_repository.dart';
import 'package:project_smm/entities/main_page_entities/add_brigades_parameters.dart';
import 'package:project_smm/entities/main_page_entities/add_calls_parameters.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesPageUninitialisedState()) {

    List<BrigadesListModel>? brigades = [];
    int brigadesCount = 0;
    List<Parameters> callsParametersList = [];
    List<Parameters> brigadesParametersList = [];

    addCallsParameters(callsParametersList);

    addBrigadesParameters(brigadesParametersList);
    on<FavouritesPageStartLoadingEvent>((event, emit) async{
      addSearchBrigadesParameters(brigadesParametersList, event.searchModel);

      addSearchCallsParameters(callsParametersList, event.searchModel);
      callsParametersList.toSet();
      callsParametersList.toList();
      brigadesParametersList.toSet();
      brigadesParametersList.toList();
      if (!event.shouldLoadMore) {
        emit(FavouritesPageLoadingState());
        final reBrigades = await FavouritesBrigadesRepository.favouritesBrigades(ParamsModel(
            parameters: brigadesParametersList, limit: 10, offset: 0));
        reBrigades.fold((l) {
          if (l is LogOutFailure) {
            emit(FavouritesPageLogoutState());
          } else if (l is ServerFailure) {
            emit(FavouritesPageFailedState(message: l.error));
          }
        }, (r) {
          brigades = r.brigades;
          brigadesCount = r.allCount;
        });

        final reCalls = await FavouritesCallsRepository.favouritesCalls(ParamsModel(
          parameters: callsParametersList,
          limit: 10,
          offset: 0,
        ));
        reCalls.fold((l) {
          if (l is LogOutFailure) {
            emit(FavouritesPageLogoutState());
          } else if (l is ServerFailure) {
            emit(FavouritesPageFailedState(message: l.error));
          }
        }, (r) {
          emit(FavouritesPageDoneState(
              calls: r.calls ?? [],
              brigades: brigades ?? [],
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      } else {
        FavouritesPageDoneState newState = state as FavouritesPageDoneState;
        final reBrigades = await FavouritesBrigadesRepository.favouritesBrigades(ParamsModel(
            parameters: brigadesParametersList,
            limit: 10,
            offset: newState.brigades == null ? 0 : newState.brigades!.length));
        reBrigades.fold((l) {
          if (l is LogOutFailure) {
            emit(FavouritesPageLogoutState());
          } else if (l is ServerFailure) {
            emit(FavouritesPageFailedState(message: l.error));
          }
        }, (r) {
          brigades = r.brigades;
          brigadesCount = r.allCount;
        });

        final reCalls = await FavouritesCallsRepository.favouritesCalls(ParamsModel(
          parameters: callsParametersList,
          limit: 10,
          offset: newState.calls!.isEmpty ? 0 : newState.calls!.length,
        ));
        reCalls.fold((l) {
          if (l is LogOutFailure) {
            emit(FavouritesPageLogoutState());
          } else if (l is ServerFailure) {
            emit(FavouritesPageFailedState(message: l.error));
          }
        }, (r) {
          emit(FavouritesPageDoneState(
              calls: newState.calls! + (r.calls ?? []),
              brigades: newState.brigades! + (brigades ?? []),
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      }
    });
    on<FavouritesPageDeleteEvent> ((event, emit)async {
      final re = await FavouritesDeleteRepository.favouritesDelete(event.id!, event.whatDelete!);
      re.fold((l) {
        if (l is LogOutFailure) {
          emit(FavouritesPageLogoutState());
        } else if (l is ServerFailure) {
          emit(FavouritesPageFailedState(message: l.error));
        }
      }, (r) {});
    });
  }
}
