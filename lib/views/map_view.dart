import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/custom_blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;
  const MapView(
      {super.key, required this.initialLocation, required this.polylines});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition = CameraPosition(
        // bearing: 192.8334901395799,
        // target: LatLng(37.43296265331129, -122.08832357078792),
        // target: state.lastKnownLocation!,
        target: initialLocation,
        // tilt: 59.440717697143555,
        zoom: 15);

    final size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          onPointerMove: (pointerMoveEvent) =>
              mapBloc.add(OnStopFollowingUserEvent()),
          child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            compassEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            polylines: polylines,

            onMapCreated: ((controller) =>
                mapBloc.add(OnMapInitializedEvent(controller))),

            onCameraMove: (position) => mapBloc.mapCenter = position.target,

            // TODO:  MarKers
            // TODO: Polylines
            // TODO: Cuando Se Mueve El Mapa
          ),
        ));
  }
}
