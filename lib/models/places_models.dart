import 'dart:convert';

class PlacesResponse {
  final String type;
  final List<String> query;
  final List<Feature> features;
  final String attribution;

  PlacesResponse({
    required this.type,
    required this.query,
    required this.features,
    required this.attribution,
  });

  factory PlacesResponse.fromJson(String str) =>
      PlacesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlacesResponse.fromMap(Map<String, dynamic> json) => PlacesResponse(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        features:
            List<Feature>.from(json["features"].map((x) => Feature.fromMap(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toMap())),
        "attribution": attribution,
      };
}

class Feature {
  final String? id;
  final String type;
  final List<String> placeType;
  // final int relevance;
  final Properties properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;

  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    //required this.relevance,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
    required this.context,
  });

  factory Feature.fromJson(String str) => Feature.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feature.fromMap(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        // relevance: json["relevance"],
        properties: Properties.fromMap(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: Geometry.fromMap(json["geometry"]),
        context:
            List<Context>.from(json["context"].map((x) => Context.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        // "relevance": relevance,
        "properties": properties.toMap(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toMap(),
        "context": List<dynamic>.from(context.map((x) => x.toMap())),
      };
}

class Context {
  final Id? id;
  final MapboxId? mapboxId;
  final String textEs;
  final String text;
  final Wikidata? wikidata;
  final Language? languageEs;
  final Language? language;
  final Language? shortCode;

  Context({
    required this.id,
    required this.mapboxId,
    required this.textEs,
    required this.text,
    this.wikidata,
    this.languageEs,
    this.language,
    this.shortCode,
  });

  factory Context.fromJson(String str) => Context.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Context.fromMap(Map<String, dynamic> json) => Context(
        // Cambios
        id: idValues.map[json["id"]],
        mapboxId: mapboxIdValues.map[json["mapbox_id"]],
        textEs: json["text_es"],
        text: json["text"],
        wikidata: wikidataValues.map[json["wikidata"]],
        languageEs: languageValues.map[json["language_es"]],
        language: languageValues.map[json["language"]],
        shortCode: languageValues.map[json["short_code"]],
      );

  Map<String, dynamic> toMap() => {
        "id": idValues.reverse[id],
        "mapbox_id": mapboxIdValues.reverse[mapboxId],
        "text_es": textEs,
        "text": text,
        "wikidata": wikidataValues.reverse[wikidata],
        "language_es": languageValues.reverse[languageEs],
        "language": languageValues.reverse[language],
        "short_code": languageValues.reverse[shortCode],
      };
}

enum Id { COUNTRY_8774, PLACE_39954502, POSTCODE_14429766, REGION_312390 }

final idValues = EnumValues({
  "country.8774": Id.COUNTRY_8774,
  "place.39954502": Id.PLACE_39954502,
  "postcode.14429766": Id.POSTCODE_14429766,
  "region.312390": Id.REGION_312390
});

enum Language { ES, ES_CC }

final languageValues = EnumValues({"es": Language.ES, "ES-CC": Language.ES_CC});

enum MapboxId {
  D_X_JU_OM1_IE_H_BS_YZOZ_QZ_VH,
  D_X_JU_OM1_IE_H_BS_YZP_BB_UDV_UMC,
  D_X_JU_OM1_IE_H_BS_YZP_CTVJH,
  D_X_JU_OM1_IE_H_BS_YZP_JA1_K
}

final mapboxIdValues = EnumValues({
  "dXJuOm1ieHBsYzozQzVH": MapboxId.D_X_JU_OM1_IE_H_BS_YZOZ_QZ_VH,
  "dXJuOm1ieHBsYzpBbUdvUmc": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_BB_UDV_UMC,
  "dXJuOm1ieHBsYzpCTVJH": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_CTVJH,
  "dXJuOm1ieHBsYzpJa1k": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_JA1_K
});

enum Wikidata { Q29, Q81977, Q965529 }

final wikidataValues = EnumValues({
  "Q29": Wikidata.Q29,
  "Q81977": Wikidata.Q81977,
  "Q965529": Wikidata.Q965529
});

class Geometry {
  final List<double> coordinates;
  final String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(String str) => Geometry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}

class Properties {
  // Cambios
  final String? foursquare;
  final bool? landmark;
  final String? address;
  final String? category;
  final String? maki;

  Properties({
    required this.foursquare,
    required this.landmark,
    this.address,
    required this.category,
    this.maki,
  });

  factory Properties.fromJson(String str) =>
      Properties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Properties.fromMap(Map<String, dynamic> json) => Properties(
        foursquare: json["foursquare"],
        landmark: json["landmark"],
        address: json["address"],
        category: json["category"],
        maki: json["maki"],
      );

  Map<String, dynamic> toMap() => {
        "foursquare": foursquare,
        "landmark": landmark,
        "address": address,
        "category": category,
        "maki": maki,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
