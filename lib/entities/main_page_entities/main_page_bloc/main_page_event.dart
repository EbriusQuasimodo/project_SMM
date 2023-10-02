part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class MainPageStartLoadingEvent extends MainPageEvent{
  final int offsetCalls;
  final int offsetBrigades;


  MainPageStartLoadingEvent({required this.offsetCalls, required this.offsetBrigades});
}
class MainPageBrigadesStartLoadingEvent extends MainPageEvent{}
