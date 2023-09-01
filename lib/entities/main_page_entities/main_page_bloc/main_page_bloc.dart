
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/repository/brigade_repository.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/repository/calls_repository.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageLoadingState()) {
    on<MainPageCallsStartLoadingEvent>((event, emit) async {
      emit(MainPageLoadingState());
      final re = await CallsRepository.calls();
      re.fold((l) {
        if (l is LogOutFailure) {
          emit(MainPageLogoutState());
        } else if (l is ServerFailure) {
          emit(MainPageFailedState(message: l.error));
        }
      }, (r) => emit(MainPageCallsDoneState(calls: r.calls)));
    });

    on<MainPageBrigadesStartLoadingEvent>((event, emit) async {
      emit(MainPageLoadingState());
      final re = await BrigadesRepository.brigades();
      re.fold((l) {
        if (l is LogOutFailure) {
          emit(MainPageLogoutState());
        } else if (l is ServerFailure) {
          emit(MainPageFailedState(message: l.error));
        }
      }, (r) => emit(MainPageBrigadesDoneState(brigades: r.calls)));
    });
  }
}
