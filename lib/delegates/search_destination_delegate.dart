import 'package:flutter/material.dart';
import 'package:maps_app/models/custom_models.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResult> {
  SearchDestinationDelegate() : super(searchFieldLabel: 'Buscar...');

  @override
  List<Widget>? buildActions(BuildContext context) {
    // // TODO: implement buildActions
    // throw UnimplementedError();
    return [
      // Text('BuildActions'),
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // // TODO: implement buildLeading
    // throw UnimplementedError();
    // return const Text('BuildLeading');
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          final result = SearchResult(cancel: true);
          close(context, result);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // // TODO: implement buildResults
    // throw UnimplementedError();
    return const Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // // TODO: implement buildSuggestions
    // throw UnimplementedError();
    // return const Text('BuildSuggestions');
    return ListView(
      children: [
        ListTile(
          leading: const Icon(
            Icons.location_on_outlined,
            color: Colors.black,
          ),
          title: const Text('Colocar LA Ubicación Manualmente',
              style: TextStyle(color: Colors.black)),
          onTap: () {
            //TODO: Regresar Algo...
            final result = SearchResult(cancel: false, manual: true);

            close(context, result);
          },
        )
      ],
    );
  }
}
