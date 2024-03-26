// To parse this JSON data, do
//
//     final productSellOrderResponseVo = productSellOrderResponseVoFromJson(jsonString);

import 'dart:convert';

ProductSellOrderResponseVo productSellOrderResponseVoFromJson(String str) => ProductSellOrderResponseVo.fromJson(json.decode(str));

String productSellOrderResponseVoToJson(ProductSellOrderResponseVo data) => json.encode(data.toJson());

class ProductSellOrderResponseVo {
  int? code;
  String? message;
  OrderData? data;

  ProductSellOrderResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory ProductSellOrderResponseVo.fromJson(Map<String, dynamic> json) => ProductSellOrderResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : OrderData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class OrderData {
  String? sellerProductTypeId;
  DateTime? orderDate;
  int? ricePercentageOne;
  int? ricePercentageTwo;
  String? weight;
  int? measurementId;
  int? totalAmount;
  int? price;
  String? address;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  dynamic photo;
  List<dynamic>? media;

  OrderData({
    this.sellerProductTypeId,
    this.orderDate,
    this.ricePercentageOne,
    this.ricePercentageTwo,
    this.weight,
    this.measurementId,
    this.totalAmount,
    this.price,
    this.address,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.photo,
    this.media,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    sellerProductTypeId: json["seller_product_type_id"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    ricePercentageOne: json["rice_percentage_one"],
    ricePercentageTwo: json["rice_percentage_two"],
    weight: json["weight"],
    measurementId: json["measurement_id"],
    totalAmount: json["total_amount"],
    price: json["price"],
    address: json["address"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    photo: json["photo"],
    media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "seller_product_type_id": sellerProductTypeId,
    "order_date": orderDate?.toIso8601String(),
    "rice_percentage_one": ricePercentageOne,
    "rice_percentage_two": ricePercentageTwo,
    "weight": weight,
    "measurement_id": measurementId,
    "total_amount": totalAmount,
    "price": price,
    "address": address,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "photo": photo,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
  };
}
