import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_app/blocs/custom_blocs.dart';

import 'package:maps_app/screens/custom_screens.dart';
import 'package:maps_app/services/custom_services.dart';

void main() {
  // runApp(const MapsApp());
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => LocationBloc()),
      BlocProvider(
          create: (context) =>
              MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
      BlocProvider(
          create: (context) => SearchBloc(trafficService: TrafficService())),
    ],
    child: const MapsApp(),
  ));
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MapsApp',
        home: LoadingScreen());
  }
}
