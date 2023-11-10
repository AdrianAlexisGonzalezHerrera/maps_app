part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool isShowMyRoute;

  //*  Polylines
  final Map<String, Polyline> polylines;

  /*
  'mi_ruta: {
    id: polylineID Google,
    points: [ [ lat, lng ], [ 1242154, 1236548 ], [ 1245315, 12235564 ] ],
    width: 3,
    color: Colors.Black,
  }'
  */

  const MapState(
      {this.isMapInitialized = false,
      this.isFollowingUser = true,
      this.isShowMyRoute = true,
      Map<String, Polyline>? polylines})
      : polylines = polylines ?? const {};

  MapState copyWith(
          {bool? isMapInitialized,
          bool? isFollowingUser,
          bool? isShowMyRoute,
          Map<String, Polyline>? polylines}) =>
      MapState(
          isMapInitialized: isMapInitialized ?? this.isMapInitialized,
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          isShowMyRoute: isShowMyRoute ?? this.isShowMyRoute,
          polylines: polylines ?? this.polylines);

  @override
  List<Object> get props =>
      [isMapInitialized, isFollowingUser, isShowMyRoute, polylines];
}

// final class MapInitial extends MapState {}
