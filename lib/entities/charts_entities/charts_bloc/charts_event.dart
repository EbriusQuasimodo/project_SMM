part of 'charts_bloc.dart';

@immutable
abstract class ChartsEvent {}

class ChartsStartLoadingEvent extends ChartsEvent{}

class ChartsLoadedEvent{}
