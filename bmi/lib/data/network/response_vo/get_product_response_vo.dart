// To parse this JSON data, do
//
//     final getProductResponseVo = getProductResponseVoFromJson(jsonString);

import 'dart:convert';

GetProductResponseVo getProductResponseVoFromJson(String str) => GetProductResponseVo.fromJson(json.decode(str));

String getProductResponseVoToJson(GetProductResponseVo data) => json.encode(data.toJson());

class GetProductResponseVo {
  int? code;
  String? message;
  ProductTypeData? data;

  GetProductResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory GetProductResponseVo.fromJson(Map<String, dynamic> json) => GetProductResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : ProductTypeData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class ProductTypeData {
  List<Product>? products;
  List<CategoryPricess>? categoryPricess;
  List<Advanced>? advanced;
  List<CategoryPricess>? measurements;

  ProductTypeData({
    this.products,
    this.categoryPricess,
    this.advanced,
    this.measurements,
  });

  factory ProductTypeData.fromJson(Map<String, dynamic> json) => ProductTypeData(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    categoryPricess: json["categoryPricess"] == null ? [] : List<CategoryPricess>.from(json["categoryPricess"]!.map((x) => CategoryPricess.fromJson(x))),
    advanced: json["advanced"] == null ? [] : List<Advanced>.from(json["advanced"]!.map((x) => Advanced.fromJson(x))),
    measurements: json["measurements"] == null ? [] : List<CategoryPricess>.from(json["measurements"]!.map((x) => CategoryPricess.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "categoryPricess": categoryPricess == null ? [] : List<dynamic>.from(categoryPricess!.map((x) => x.toJson())),
    "advanced": advanced == null ? [] : List<dynamic>.from(advanced!.map((x) => x.toJson())),
    "measurements": measurements == null ? [] : List<dynamic>.from(measurements!.map((x) => x.toJson())),
  };
}

class Advanced {
  String? hasRicePercentage;
  String? hasMoisture;
  String? hasExport;
  String? weightLabel;
  String? totalLabel;
  String? priceLabel;

  Advanced({
    this.hasRicePercentage,
    this.hasMoisture,
    this.hasExport,
    this.weightLabel,
    this.totalLabel,
    this.priceLabel
  });

  factory Advanced.fromJson(Map<String, dynamic> json) => Advanced(
    hasRicePercentage: json["has_rice_percentage"],
    hasMoisture: json["has_moisture"],
    hasExport: json["has_export"],
    weightLabel: json["weight_label"],
    totalLabel: json["total_label"],
    priceLabel: json["price_label"],
  );

  Map<String, dynamic> toJson() => {
    "has_rice_percentage": hasRicePercentage,
    "has_moisture": hasMoisture,
    "has_export": hasExport,
    "weight_label": weightLabel,
    "total_label": totalLabel,
    "price_label": priceLabel,
  };
}

class CategoryPricess {
  int? id;
  String? name;

  CategoryPricess({
    this.id,
    this.name,
  });

  factory CategoryPricess.fromJson(Map<String, dynamic> json) => CategoryPricess(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Product {
  int? id;
  int? productCategoryId;
  String? name;

  Product({
    this.id,
    this.productCategoryId,
    this.name,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productCategoryId: json["product_category_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_category_id": productCategoryId,
    "name": name,
  };
}
