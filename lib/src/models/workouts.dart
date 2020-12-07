// To parse this JSON data, do
//
//     final workouts = workoutsFromJson(jsonString);

import 'dart:convert';

Workouts workoutsFromJson(String str) => Workouts.fromJson(json.decode(str));

String workoutsToJson(Workouts data) => json.encode(data.toJson());

class Workouts {
  Workouts({
    this.data,
    this.links,
  });

  List<Datum> data;
  WorkoutsLinks links;

  factory Workouts.fromJson(Map<String, dynamic> json) => Workouts(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: WorkoutsLinks.fromJson(json["links"]),
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
    this.createdAt,
    this.scheduledDateInt,
    this.scheduledDate,
    this.track,
    this.displayOrder,
    this.title,
    this.description,
    this.scoreType,
    this.publishAt,
    this.isPublished,
    this.movementIds,
  });

  DateTime createdAt;
  int scheduledDateInt;
  DateTime scheduledDate;
  Track track;
  double displayOrder;
  String title;
  String description;
  String scoreType;
  DateTime publishAt;
  bool isPublished;
  List<String> movementIds;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        createdAt: DateTime.parse(json["created_at"]),
        scheduledDateInt: json["scheduled_date_int"],
        scheduledDate: DateTime.parse(json["scheduled_date"]),
        track: Track.fromJson(json["track"]),
        displayOrder: json["display_order"].toDouble(),
        title: json["title"],
        description: json["description"],
        scoreType: json["score_type"],
        publishAt: DateTime.parse(json["publish_at"]),
        isPublished: json["is_published"],
        movementIds: List<String>.from(json["movement_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "scheduled_date_int": scheduledDateInt,
        "scheduled_date": scheduledDate.toIso8601String(),
        "track": track.toJson(),
        "display_order": displayOrder,
        "title": title,
        "description": description,
        "score_type": scoreType,
        "publish_at": publishAt.toIso8601String(),
        "is_published": isPublished,
        "movement_ids": List<dynamic>.from(movementIds.map((x) => x)),
      };
}

class Track {
  Track({
    this.id,
    this.type,
    this.attributesFor,
  });

  String id;
  String type;
  AttributesFor attributesFor;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        type: json["type"],
        attributesFor: AttributesFor.fromJson(json["attributes_for"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes_for": attributesFor.toJson(),
      };
}

class AttributesFor {
  AttributesFor({
    this.createdAt,
    this.name,
    this.type,
  });

  DateTime createdAt;
  String name;
  String type;

  factory AttributesFor.fromJson(Map<String, dynamic> json) => AttributesFor(
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "type": type,
      };
}

class DatumLinks {
  DatumLinks({
    this.uiResults,
  });

  String uiResults;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
        uiResults: json["ui_results"],
      );

  Map<String, dynamic> toJson() => {
        "ui_results": uiResults,
      };
}

class WorkoutsLinks {
  WorkoutsLinks({
    this.self,
    this.uiCalendar,
  });

  String self;
  String uiCalendar;

  factory WorkoutsLinks.fromJson(Map<String, dynamic> json) => WorkoutsLinks(
        self: json["self"],
        uiCalendar: json["ui_calendar"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "ui_calendar": uiCalendar,
      };
}
