// To parse this JSON data, do
//
//     final orderHistoryResponseVo = orderHistoryResponseVoFromJson(jsonString);

import 'dart:convert';

OrderHistoryResponseVo orderHistoryResponseVoFromJson(String str) => OrderHistoryResponseVo.fromJson(json.decode(str));

String orderHistoryResponseVoToJson(OrderHistoryResponseVo data) => json.encode(data.toJson());

class OrderHistoryResponseVo {
  int? code;
  String? message;
  List<OrderData>? data;

  OrderHistoryResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory OrderHistoryResponseVo.fromJson(Map<String, dynamic> json) => OrderHistoryResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<OrderData>.from(json["data"]!.map((x) => OrderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderData {
  String? orderDate;
  String? sellerName;
  String? productType;
  String? productCategory;
  String? ricePercentageOne;
  String? ricePercentageTwo;
  String? moisture;
  String? weight;
  String? totalAmount;
  String? price;
  String? address;
  String? categoryPriceName;
  int? orderStatus;
  String? statusName;
  Photo? photo;
  String? remark;
  String? phoneNo;

  OrderData({
    this.orderDate,
    this.sellerName,
    this.productType,
    this.productCategory,
    this.ricePercentageOne,
    this.ricePercentageTwo,
    this.moisture,
    this.weight,
    this.totalAmount,
    this.price,
    this.address,
    this.categoryPriceName,
    this.orderStatus,
    this.statusName,
    this.photo,
    this.remark,
    this.phoneNo
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    orderDate: json["order_date"],
    sellerName: json["seller_name"],
    productType: json["product_type"],
    productCategory: json["product_category"],
    ricePercentageOne: json["rice_percentage_one"],
    ricePercentageTwo: json["rice_percentage_two"],
    moisture: json["moisture"],
    weight: json["weight"],
    totalAmount: json["total_amount"],
    price: json["price"],
    address: json["address"],
    categoryPriceName: json["category_price_name"],
    orderStatus: json["order_status"],
    statusName: json["status_name"],
    photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    remark: json["remark"],
    phoneNo: json["phone_no"]
  );

  Map<String, dynamic> toJson() => {
    "order_date": orderDate,
    "seller_name": sellerName,
    "product_type": productType,
    "product_category": productCategory,
    "rice_percentage_one": ricePercentageOne,
    "rice_percentage_two": ricePercentageTwo,
    "moisture": moisture,
    "weight": weight,
    "total_amount": totalAmount,
    "price": price,
    "address": address,
    "category_price_name": categoryPriceName,
    "order_status": orderStatus,
    "status_name": statusName,
    "photo": photo?.toJson(),
    "remark":remark,
    "phone_no":phoneNo
  };
}

class Photo {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  GeneratedConversions? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;
  String? thumbnail;
  String? preview;
  String? originalUrl;
  String? previewUrl;

  Photo({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.thumbnail,
    this.preview,
    this.originalUrl,
    this.previewUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    modelType: json["model_type"],
    modelId: json["model_id"],
    uuid: json["uuid"],
    collectionName: json["collection_name"],
    name: json["name"],
    fileName: json["file_name"],
    mimeType: json["mime_type"],
    disk: json["disk"],
    conversionsDisk: json["conversions_disk"],
    size: json["size"],
    manipulations: json["manipulations"] == null ? [] : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
    customProperties: json["custom_properties"] == null ? [] : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
    generatedConversions: json["generated_conversions"] == null ? null : GeneratedConversions.fromJson(json["generated_conversions"]),
    responsiveImages: json["responsive_images"] == null ? [] : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
    orderColumn: json["order_column"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    url: json["url"],
    thumbnail: json["thumbnail"],
    preview: json["preview"],
    originalUrl: json["original_url"],
    previewUrl: json["preview_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_type": modelType,
    "model_id": modelId,
    "uuid": uuid,
    "collection_name": collectionName,
    "name": name,
    "file_name": fileName,
    "mime_type": mimeType,
    "disk": disk,
    "conversions_disk": conversionsDisk,
    "size": size,
    "manipulations": manipulations == null ? [] : List<dynamic>.from(manipulations!.map((x) => x)),
    "custom_properties": customProperties == null ? [] : List<dynamic>.from(customProperties!.map((x) => x)),
    "generated_conversions": generatedConversions?.toJson(),
    "responsive_images": responsiveImages == null ? [] : List<dynamic>.from(responsiveImages!.map((x) => x)),
    "order_column": orderColumn,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "url": url,
    "thumbnail": thumbnail,
    "preview": preview,
    "original_url": originalUrl,
    "preview_url": previewUrl,
  };
}

class GeneratedConversions {
  bool? thumb;
  bool? preview;

  GeneratedConversions({
    this.thumb,
    this.preview,
  });

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) => GeneratedConversions(
    thumb: json["thumb"],
    preview: json["preview"],
  );

  Map<String, dynamic> toJson() => {
    "thumb": thumb,
    "preview": preview,
  };
}
