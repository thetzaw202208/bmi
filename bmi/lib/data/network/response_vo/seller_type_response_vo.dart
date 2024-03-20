// To parse this JSON data, do
//
//     final sellerTypeVo = sellerTypeVoFromJson(jsonString);

import 'dart:convert';

SellerTypeVo sellerTypeVoFromJson(String str) => SellerTypeVo.fromJson(json.decode(str));

String sellerTypeVoToJson(SellerTypeVo data) => json.encode(data.toJson());

class SellerTypeVo {
  int? code;
  String? message;
  List<SellerTypeData>? data;

  SellerTypeVo({
    this.code,
    this.message,
    this.data,
  });

  factory SellerTypeVo.fromJson(Map<String, dynamic> json) => SellerTypeVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SellerTypeData>.from(json["data"]!.map((x) => SellerTypeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SellerTypeData {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  SellerTypeData({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory SellerTypeData.fromJson(Map<String, dynamic> json) => SellerTypeData(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
