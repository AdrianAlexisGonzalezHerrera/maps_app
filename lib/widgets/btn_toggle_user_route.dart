import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/custom_blocs.dart';
// import 'package:maps_app/ui/custom_ui.dart';

class BtnToggleUserRoute extends StatelessWidget {
  const BtnToggleUserRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 25,
          child: IconButton(
              icon: const Icon(Icons.more_horiz_rounded, color: Colors.black),
              onPressed: () {
                mapBloc.add(OnToggleUserRoute());
              })),
    );
  }
}
