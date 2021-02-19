// To parse this JSON data, do
//
//     final sumberModel = sumberModelFromJson(jsonString);

import 'dart:convert';

List<SumberModel> sumberModelFromJson(String str) => List<SumberModel>.from(
    json.decode(str).map((x) => SumberModel.fromJson(x)));

String sumberModelToJson(List<SumberModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SumberModel {
  SumberModel({
    this.id,
    this.title,
    this.kind,
  });

  String id;
  String title;
  Kind kind;

  factory SumberModel.fromJson(Map<String, dynamic> json) => SumberModel(
        id: json["id"],
        title: json["title"],
        kind: kindValues.map[json["kind"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "kind": kindValues.reverse[kind],
      };
}

enum Kind { GAWE, KLIEN }

final kindValues = EnumValues({"gawe": Kind.GAWE, "klien": Kind.KLIEN});

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
