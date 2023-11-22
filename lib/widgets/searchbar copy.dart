import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_app/blocs/custom_blocs.dart';
import 'package:maps_app/delegates/custom_delegates.dart';
import 'package:maps_app/models/custom_models.dart';

class SearchBar1 extends StatelessWidget {
  const SearchBar1({super.key});

  void onSearchResults(BuildContext context, SearchResult result) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    if (result.manual == true) {
      searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
