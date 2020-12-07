// To parse this JSON data, do
//
//     final workout = workoutFromJson(jsonString);

import 'dart:convert';

Workout workoutFromJson(String str) => Workout.fromJson(json.decode(str));

String workoutToJson(Workout data) => json.encode(data.toJson());

class Workout {
  Workout({
    this.data,
    this.links,
  });

  Data data;
  WorkoutLinks links;

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        data: Data.fromJson(json["data"]),
        links: WorkoutLinks.fromJson(json["links"]),
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
    this.type,
  });

  String type;

  factory AttributesFor.fromJson(Map<String, dynamic> json) => AttributesFor(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class DataLinks {
  DataLinks({
    this.uiResults,
  });

  String uiResults;

  factory DataLinks.fromJson(Map<String, dynamic> json) => DataLinks(
        uiResults: json["ui_results"],
      );

  Map<String, dynamic> toJson() => {
        "ui_results": uiResults,
      };
}

class WorkoutLinks {
  WorkoutLinks({
    this.self,
  });

  String self;

  factory WorkoutLinks.fromJson(Map<String, dynamic> json) => WorkoutLinks(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}
