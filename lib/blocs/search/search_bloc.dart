import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

import 'package:maps_app/models/custom_models.dart';
import 'package:maps_app/services/custom_services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TrafficService trafficService;
  SearchBloc({required this.trafficService}) : super(const SearchState()) {
    on<OnActivateManualMarkerEvent>(
        (event, emit) => emit(state.copyWith(displayManualMarker: true)));

    on<OnDesActivateManualMarkerEvent>(
        (event, emit) => emit(state.copyWith(displayManualMarker: false)));

    on<OnNewPlacesFoundEvent>(
        (event, emit) => emit(state.copyWith(places: event.places)));

    on<OnAddToHistoryEvent>((event, emit) =>
        emit(state.copyWith(history: [event.place, ...state.history])));
  }

  //*  Metodos

  Future<RouteDestination> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final trafficResponce = await trafficService.getCoorsStartToEnd(start, end);

    final geometry = trafficResponce.routes[0].geometry;
    final distance = trafficResponce.routes[0].distance;
    final duration = trafficResponce.routes[0].duration;

    //*  Decodificar El Geometry

    final points = decodePolyline(geometry, accuracyExponent: 6);

    final latLngList = points
        .map((coor) => LatLng(coor[0].toDouble(), coor[1].toDouble()))
        .toList();

    return RouteDestination(
        points: latLngList, duration: duration, distance: distance);
  }

  Future getPlacesByQuery(LatLng proximity, String query) async {
    final newPlaces = await trafficService.getResultsByQuery(proximity, query);

    // TODO: Por Aquí Tenemos Que Almacenar En El State
    add(OnNewPlacesFoundEvent(newPlaces));
  }
}
