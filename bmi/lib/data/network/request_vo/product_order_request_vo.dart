// To parse this JSON data, do
//
//     final productSellOrderRequestVo = productSellOrderRequestVoFromJson(jsonString);

import 'dart:convert';

ProductSellOrderRequestVo productSellOrderRequestVoFromJson(String str) => ProductSellOrderRequestVo.fromJson(json.decode(str));

String productSellOrderRequestVoToJson(ProductSellOrderRequestVo data) => json.encode(data.toJson());

class ProductSellOrderRequestVo {
  int? productCategoryId;
  String? sellerProductTypeId;
  String? productTypeName;
  DateTime? orderDate;
  int? ricePercentageOne;
  int? ricePercentageTwo;
  String? weight;
  int? measurementId;
  int? totalAmount;
  int? price;
  String? address;
  String? photo;

  ProductSellOrderRequestVo({
    this.productCategoryId,
    this.sellerProductTypeId,
    this.productTypeName,
    this.orderDate,
    this.ricePercentageOne,
    this.ricePercentageTwo,
    this.weight,
    this.measurementId,
    this.totalAmount,
    this.price,
    this.address,
    this.photo,
  });

  factory ProductSellOrderRequestVo.fromJson(Map<String, dynamic> json) => ProductSellOrderRequestVo(
    productCategoryId: json["product_category_id"],
    sellerProductTypeId: json["seller_product_type_id"],
    productTypeName: json["product_type_name"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    ricePercentageOne: json["rice_percentage_one"],
    ricePercentageTwo: json["rice_percentage_two"],
    weight: json["weight"],
    measurementId: json["measurement_id"],
    totalAmount: json["total_amount"],
    price: json["price"],
    address: json["address"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "product_category_id": productCategoryId,
    "seller_product_type_id": sellerProductTypeId,
    "product_type_name": productTypeName,
    "order_date": orderDate?.toIso8601String(),
    "rice_percentage_one": ricePercentageOne,
    "rice_percentage_two": ricePercentageTwo,
    "weight": weight,
    "measurement_id": measurementId,
    "total_amount": totalAmount,
    "price": price,
    "address": address,
    "photo": photo,
  };
}
