class SearchResult {
  final bool cancel;
  final bool manual;

  SearchResult({required this.cancel, this.manual = false});

  // TODO:
  // name, description, LatLon

  @override
  String toString() {
    return '{ cancel: $cancel, manual: $manual }';
  }
}
