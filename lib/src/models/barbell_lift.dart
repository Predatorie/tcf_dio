// To parse this JSON data, do
//
//     final barbellLift = barbellLiftFromJson(jsonString);

import 'dart:convert';

BarbellLift barbellLiftFromJson(String str) =>
    BarbellLift.fromJson(json.decode(str));

String barbellLiftToJson(BarbellLift data) => json.encode(data.toJson());

class BarbellLift {
  BarbellLift({
    this.data,
    this.links,
  });

  Data data;
  BarbellLiftLinks links;

  factory BarbellLift.fromJson(Map<String, dynamic> json) => BarbellLift(
        data: Data.fromJson(json["data"]),
        links: BarbellLiftLinks.fromJson(json["links"]),
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

class DataLinks {
  DataLinks();

  factory DataLinks.fromJson(Map<String, dynamic> json) => DataLinks();

  Map<String, dynamic> toJson() => {};
}

class BarbellLiftLinks {
  BarbellLiftLinks({
    this.self,
  });

  String self;

  factory BarbellLiftLinks.fromJson(Map<String, dynamic> json) =>
      BarbellLiftLinks(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}
