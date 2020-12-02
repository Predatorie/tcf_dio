// To parse this JSON data, do
//
//     final athletes = athletesFromJson(jsonString);

import 'dart:convert';

Athletes athletesFromJson(String str) => Athletes.fromJson(json.decode(str));

String athletesToJson(Athletes data) => json.encode(data.toJson());

class Athletes {
  Athletes({
    this.data,
    this.links,
  });

  List<Datum> data;
  AthletesLinks links;

  factory Athletes.fromJson(Map<String, dynamic> json) => Athletes(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: AthletesLinks.fromJson(json["links"]),
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

  Type type;
  String id;
  Attributes attributes;
  DatumLinks links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: typeValues.map[json["type"]],
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
        links: DatumLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "id": id,
        "attributes": attributes.toJson(),
        "links": links.toJson(),
      };
}

class Attributes {
  Attributes({
    this.createdAt,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.profileImageUrl,
    this.lastLogin,
  });

  DateTime createdAt;
  String firstName;
  String lastName;
  String email;
  Gender gender;
  String profileImageUrl;
  DateTime lastLogin;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        createdAt: DateTime.parse(json["created_at"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: genderValues.map[json["gender"]],
        profileImageUrl: json["profile_image_url"] == null
            ? null
            : json["profile_image_url"],
        lastLogin: DateTime.parse(json["last_login"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": genderValues.reverse[gender],
        "profile_image_url": profileImageUrl == null ? null : profileImageUrl,
        "last_login": lastLogin.toIso8601String(),
      };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

class DatumLinks {
  DatumLinks({
    this.uiAthlete,
    this.removeFromAffiliate,
  });

  String uiAthlete;
  String removeFromAffiliate;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
        uiAthlete: json["ui_athlete"],
        removeFromAffiliate: json["remove_from_affiliate"],
      );

  Map<String, dynamic> toJson() => {
        "ui_athlete": uiAthlete,
        "remove_from_affiliate": removeFromAffiliate,
      };
}

enum Type { ATHLETES }

final typeValues = EnumValues({"athletes": Type.ATHLETES});

class AthletesLinks {
  AthletesLinks({
    this.self,
    this.next,
  });

  String self;
  String next;

  factory AthletesLinks.fromJson(Map<String, dynamic> json) => AthletesLinks(
        self: json["self"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "next": next,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
