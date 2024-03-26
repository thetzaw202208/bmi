// To parse this JSON data, do
//
//     final getProductCatResponseVo = getProductCatResponseVoFromJson(jsonString);

import 'dart:convert';

GetProductCatResponseVo getProductCatResponseVoFromJson(String str) => GetProductCatResponseVo.fromJson(json.decode(str));

String getProductCatResponseVoToJson(GetProductCatResponseVo data) => json.encode(data.toJson());

class GetProductCatResponseVo {
  int? code;
  String? message;
  List<ProductCatData>? data;

  GetProductCatResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory GetProductCatResponseVo.fromJson(Map<String, dynamic> json) => GetProductCatResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ProductCatData>.from(json["data"]!.map((x) => ProductCatData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductCatData {
  int? id;
  String? name;
  Photo? photo;

  ProductCatData({
    this.id,
    this.name,
    this.photo,
  });

  factory ProductCatData.fromJson(Map<String, dynamic> json) => ProductCatData(
    id: json["id"],
    name: json["name"],
    photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo?.toJson(),
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
