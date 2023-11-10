import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_app/blocs/custom_blocs.dart';
import 'package:maps_app/views/custom_views.dart';
import 'package:maps_app/widgets/custom_widgets.dart';

// class MapScreen extends StatelessWidget {
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    // final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          if (locationState.lastKnownLocation == null) {
            return Center(
              child: Text('Espere Por Favor...!!!'),
            );
          }
          // return Center(
          //   child: Text(
          //       '${state.lastKnownLocation!.latitude}, ${state.lastKnownLocation!.longitude}'),
          // );
          // final CameraPosition initialCameraPosition = CameraPosition(
          //     // bearing: 192.8334901395799,
          //     // target: LatLng(37.43296265331129, -122.08832357078792),
          //     target: state.lastKnownLocation!,
          //     // tilt: 59.440717697143555,
          //     zoom: 15);
//
          // return GoogleMap(initialCameraPosition: initialCameraPosition);

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              Map<String, Polyline> polylines = Map.from(mapState.polylines);
              if (!mapState.isShowMyRoute) {
                polylines.removeWhere((key, value) => key == 'myRoute');
              }

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                      initialLocation: locationState.lastKnownLocation!,
                      // polylines: mapState.polylines.values.toSet(),
                      polylines: polylines.values.toSet(),
                    ),

                    // TODO:  Botones...
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          BtnToggleUserRoute(),
          BtnFollowUser(),
          BtnCurrentLocation(),
        ],
      ),
    );
  }
}
