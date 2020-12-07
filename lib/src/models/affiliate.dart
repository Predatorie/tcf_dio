// To parse this JSON data, do
//
//     final box = boxFromJson(jsonString);

import 'dart:convert';

Box boxFromJson(String str) => Box.fromJson(json.decode(str));

String boxToJson(Box data) => json.encode(data.toJson());

class Box {
  Box({
    this.data,
    this.links,
  });

  Data data;
  Links links;

  factory Box.fromJson(Map<String, dynamic> json) => Box(
        data: Data.fromJson(json["data"]),
        links: Links.fromJson(json["links"]),
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
  dynamic links;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
        links: json["links"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "attributes": attributes.toJson(),
        "links": links,
      };
}

class Attributes {
  Attributes({
    this.createdAt,
    this.name,
    this.nickname,
    this.street,
    this.city,
    this.stateOrProvince,
    this.logoUrl,
  });

  DateTime createdAt;
  String name;
  String nickname;
  String street;
  String city;
  String stateOrProvince;
  String logoUrl;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        nickname: json["nickname"],
        street: json["street"],
        city: json["city"],
        stateOrProvince: json["state_or_province"],
        logoUrl: json["logo_url"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "nickname": nickname,
        "street": street,
        "city": city,
        "state_or_province": stateOrProvince,
        "logo_url": logoUrl,
      };
}

class Links {
  Links({
    this.self,
    this.athletes,
    this.workouts,
    this.tracks,
    this.uiHome,
  });

  String self;
  String athletes;
  String workouts;
  String tracks;
  String uiHome;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        athletes: json["athletes"],
        workouts: json["workouts"],
        tracks: json["tracks"],
        uiHome: json["ui_home"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "athletes": athletes,
        "workouts": workouts,
        "tracks": tracks,
        "ui_home": uiHome,
      };
}
