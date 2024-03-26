// To parse this JSON data, do
//
//     final measurementResponseVo = measurementResponseVoFromJson(jsonString);

import 'dart:convert';

MeasurementResponseVo measurementResponseVoFromJson(String str) => MeasurementResponseVo.fromJson(json.decode(str));

String measurementResponseVoToJson(MeasurementResponseVo data) => json.encode(data.toJson());

class MeasurementResponseVo {
  int? code;
  String? message;
  List<MeasurementData>? data;

  MeasurementResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory MeasurementResponseVo.fromJson(Map<String, dynamic> json) => MeasurementResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<MeasurementData>.from(json["data"]!.map((x) => MeasurementData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MeasurementData {
  int? id;
  String? name;
  int? type;
  dynamic productCategoryId;
  dynamic createdAt;
  dynamic updatedAt;

  MeasurementData({
    this.id,
    this.name,
    this.type,
    this.productCategoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory MeasurementData.fromJson(Map<String, dynamic> json) => MeasurementData(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    productCategoryId: json["product_category_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "product_category_id": productCategoryId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
