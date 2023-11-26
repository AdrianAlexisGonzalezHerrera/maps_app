import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_app/blocs/custom_blocs.dart';
import 'package:maps_app/delegates/custom_delegates.dart';
import 'package:maps_app/models/custom_models.dart';

class SearchBar1 extends StatelessWidget {
  const SearchBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
            ? const SizedBox()
            : const _SearchBar1Body();
      },
    );
  }
}

class _SearchBar1Body extends StatelessWidget {
  const _SearchBar1Body({super.key});

  void onSearchResults(BuildContext context, SearchResult result) async {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    if (result.manual == true) {
      searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
    //else {
    //  searchBloc.add(OnDesActivateManualMarkerEvent());
    //}

    // TODO: Revisar Si Tenemos Result.position
    if (result.position != null) {
      final start = locationBloc.state.lastKnownLocation;

      final destination =
          await searchBloc.getCoorsStartToEnd(start!, result.position!);
      await mapBloc.drawRoutePolyline(destination);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FadeInDown(
        duration: const Duration(milliseconds: 300),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: GestureDetector(
            onTap: () async {
              // print('onTap');
              final result = await showSearch(
                  context: context, delegate: SearchDestinationDelegate());

              if (result == null) return;

              // print(result);
              onSearchResults(context, result);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: const Text('¿ Donde Quieres Ir ?',
                  style: TextStyle(color: Colors.black87)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
