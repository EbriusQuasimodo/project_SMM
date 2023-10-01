
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/api/get_dictionary.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/lib/dictionary_enum.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/types/dictionary_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoadingState()) {
    on<FiltersStartLoadingEvent>((event, emit) async {
      emit(FiltersLoadingState());
      final reSubstations = await GetDictionary().fetch(Dictionary.substation);
      final reCityStations = await GetDictionary().fetch(Dictionary.city_station);
      emit (FiltersDoneState(substations: reSubstations.result, cityStations: reCityStations.result));

    });
  }
}
