
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageLoadingState()) {
    on<MainPageStartLoadingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
