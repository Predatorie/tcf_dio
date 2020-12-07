// To parse this JSON data, do
//
//     final movements = movementsFromJson(jsonString);

import 'dart:convert';

Movements movementsFromJson(String str) => Movements.fromJson(json.decode(str));

String movementsToJson(Movements data) => json.encode(data.toJson());

class Movements {
  Movements({
    this.data,
    this.links,
  });

  List<Datum> data;
  MovementsLinks links;

  factory Movements.fromJson(Map<String, dynamic> json) => Movements(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: MovementsLinks.fromJson(json["links"]),
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

class DatumLinks {
  DatumLinks();

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks();

  Map<String, dynamic> toJson() => {};
}

class MovementsLinks {
  MovementsLinks({
    this.self,
    this.next,
  });

  String self;
  String next;

  factory MovementsLinks.fromJson(Map<String, dynamic> json) => MovementsLinks(
        self: json["self"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "next": next,
      };
}
