// To parse this JSON data, do
//
//     final barbellLifts = barbellLiftsFromJson(jsonString);

import 'dart:convert';

BarbellLifts barbellLiftsFromJson(String str) =>
    BarbellLifts.fromJson(json.decode(str));

String barbellLiftsToJson(BarbellLifts data) => json.encode(data.toJson());

class BarbellLifts {
  BarbellLifts({
    this.data,
    this.links,
  });

  List<Datum> data;
  BarbellLiftsLinks links;

  factory BarbellLifts.fromJson(Map<String, dynamic> json) => BarbellLifts(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: BarbellLiftsLinks.fromJson(json["links"]),
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
    this.category,
  });

  String name;
  String category;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
      };
}

class DatumLinks {
  DatumLinks();

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks();

  Map<String, dynamic> toJson() => {};
}

class BarbellLiftsLinks {
  BarbellLiftsLinks({
    this.self,
    this.next,
  });

  String self;
  String next;

  factory BarbellLiftsLinks.fromJson(Map<String, dynamic> json) =>
      BarbellLiftsLinks(
        self: json["self"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "next": next,
      };
}
