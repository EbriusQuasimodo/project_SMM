part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class MainPageCallsStartLoadingEvent extends MainPageEvent{}
class MainPageBrigadesStartLoadingEvent extends MainPageEvent{}
