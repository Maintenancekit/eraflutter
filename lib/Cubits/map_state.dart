part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapGotPermission extends MapState {}

class MapLoading extends MapState {}

class MapGotLocation extends MapState {}

class MapDoneLoading extends MapState {}

class MapRefresh extends MapState {}
