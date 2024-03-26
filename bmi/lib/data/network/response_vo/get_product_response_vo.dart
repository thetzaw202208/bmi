// To parse this JSON data, do
//
//     final getProductResponseVo = getProductResponseVoFromJson(jsonString);

import 'dart:convert';

GetProductResponseVo getProductResponseVoFromJson(String str) => GetProductResponseVo.fromJson(json.decode(str));

String getProductResponseVoToJson(GetProductResponseVo data) => json.encode(data.toJson());

class GetProductResponseVo {
  int? code;
  String? message;
  List<ProductData>? data;

  GetProductResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory GetProductResponseVo.fromJson(Map<String, dynamic> json) => GetProductResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductData {
  int? id;
  String? name;
  int? productCategoryId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductData({
    this.id,
    this.name,
    this.productCategoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    name: json["name"],
    productCategoryId: json["product_category_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_category_id": productCategoryId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
