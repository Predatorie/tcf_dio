// To parse this JSON data, do
//
//     final benchMarksByCategory = benchMarksByCategoryFromJson(jsonString);

import 'dart:convert';

Benchmarks benchMarksByCategoryFromJson(String str) =>
    Benchmarks.fromJson(json.decode(str));

String benchMarksByCategoryToJson(Benchmarks data) =>
    json.encode(data.toJson());

class Benchmarks {
  Benchmarks({
    this.data,
    this.links,
  });

  List<Datum> data;
  BenchMarksByCategoryLinks links;

  factory Benchmarks.fromJson(Map<String, dynamic> json) => Benchmarks(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: BenchMarksByCategoryLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
      };
}

class Datum {
  Datum({
    this.type,
    this.id,
    this.attributes,
    this.links,
  });

  String type;
  String id;
  Attributes attributes;
  DatumLinks links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
        links: DatumLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "attributes": attributes.toJson(),
        "links": links.toJson(),
      };
}

class Attributes {
  Attributes({
    this.name,
    this.description,
    this.category,
    this.scoreType,
    this.movementIds,
  });

  String name;
  String description;
  String category;
  String scoreType;
  List<String> movementIds;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        description: json["description"],
        category: json["category"],
        scoreType: json["score_type"],
        movementIds: List<String>.from(json["movement_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "category": category,
        "score_type": scoreType,
        "movement_ids": List<dynamic>.from(movementIds.map((x) => x)),
      };
}

class DatumLinks {
  DatumLinks();

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks();

  Map<String, dynamic> toJson() => {};
}

class BenchMarksByCategoryLinks {
  BenchMarksByCategoryLinks({
    this.self,
    this.next,
  });

  String self;
  String next;

  factory BenchMarksByCategoryLinks.fromJson(Map<String, dynamic> json) =>
      BenchMarksByCategoryLinks(
        self: json["self"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "next": next,
      };
}
