// To parse this JSON data, do
//
//     final movement = movementFromJson(jsonString);

import 'dart:convert';

Movement movementFromJson(String str) => Movement.fromJson(json.decode(str));

String movementToJson(Movement data) => json.encode(data.toJson());

class Movement {
  Movement({
    this.data,
    this.links,
  });

  Data data;
  MovementLinks links;

  factory Movement.fromJson(Map<String, dynamic> json) => Movement(
        data: Data.fromJson(json["data"]),
        links: MovementLinks.fromJson(json["links"]),
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
    this.videos,
  });

  String name;
  List<Video> videos;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

class Video {
  Video({
    this.channelTitle,
    this.description,
    this.id,
    this.isFeatured,
    this.thumbnails,
    this.title,
  });

  String channelTitle;
  String description;
  String id;
  bool isFeatured;
  Thumbnails thumbnails;
  String title;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        channelTitle: json["channelTitle"],
        description: json["description"],
        id: json["id"],
        isFeatured: json["isFeatured"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "channelTitle": channelTitle,
        "description": description,
        "id": id,
        "isFeatured": isFeatured,
        "thumbnails": thumbnails.toJson(),
        "title": title,
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.high,
    this.maxres,
    this.medium,
    this.standard,
  });

  Default thumbnailsDefault;
  Default high;
  Default maxres;
  Default medium;
  Default standard;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        high: Default.fromJson(json["high"]),
        maxres: Default.fromJson(json["maxres"]),
        medium: Default.fromJson(json["medium"]),
        standard: Default.fromJson(json["standard"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "high": high.toJson(),
        "maxres": maxres.toJson(),
        "medium": medium.toJson(),
        "standard": standard.toJson(),
      };
}

class Default {
  Default({
    this.height,
    this.url,
    this.width,
  });

  int height;
  String url;
  int width;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}

class DataLinks {
  DataLinks();

  factory DataLinks.fromJson(Map<String, dynamic> json) => DataLinks();

  Map<String, dynamic> toJson() => {};
}

class MovementLinks {
  MovementLinks({
    this.self,
  });

  String self;

  factory MovementLinks.fromJson(Map<String, dynamic> json) => MovementLinks(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}
