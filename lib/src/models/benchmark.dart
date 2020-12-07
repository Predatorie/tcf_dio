// To parse this JSON data, do
//
//     final benchMark = benchMarkFromJson(jsonString);

import 'dart:convert';

Benchmark benchMarkFromJson(String str) => Benchmark.fromJson(json.decode(str));

String benchMarkToJson(Benchmark data) => json.encode(data.toJson());

class Benchmark {
  Benchmark({
    this.data,
    this.links,
  });

  Data data;
  BenchMarkLinks links;

  factory Benchmark.fromJson(Map<String, dynamic> json) => Benchmark(
        data: Data.fromJson(json["data"]),
        links: BenchMarkLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "links": links.toJson(),
      };
}

class Data {
  Data({
    this.type,
    this.id,
    this.attributes,
    this.links,
  });

  String type;
  String id;
  Attributes attributes;
  DataLinks links;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
        links: DataLinks.fromJson(json["links"]),
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

class DataLinks {
  DataLinks();

  factory DataLinks.fromJson(Map<String, dynamic> json) => DataLinks();

  Map<String, dynamic> toJson() => {};
}

class BenchMarkLinks {
  BenchMarkLinks({
    this.self,
  });

  String self;

  factory BenchMarkLinks.fromJson(Map<String, dynamic> json) => BenchMarkLinks(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}
