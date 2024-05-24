// To parse this JSON data, do
//
//     final dailyPricesResponseVo = dailyPricesResponseVoFromJson(jsonString);

import 'dart:convert';

DailyPricesResponseVo dailyPricesResponseVoFromJson(String str) => DailyPricesResponseVo.fromJson(json.decode(str));

String dailyPricesResponseVoToJson(DailyPricesResponseVo data) => json.encode(data.toJson());

class DailyPricesResponseVo {
  int? code;
  String? message;
  DailyPriceResponseData? data;

  DailyPricesResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory DailyPricesResponseVo.fromJson(Map<String, dynamic> json) => DailyPricesResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : DailyPriceResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class DailyPriceResponseData {
  int? id;
  DateTime? date;
  String? remark;
  dynamic createdAt;
  DateTime? updatedAt;
  List<TodayPrice>? todayPrices;

  DailyPriceResponseData({
    this.id,
    this.date,
    this.remark,
    this.createdAt,
    this.updatedAt,
    this.todayPrices,
  });

  factory DailyPriceResponseData.fromJson(Map<String, dynamic> json) => DailyPriceResponseData(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    remark: json["remark"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    todayPrices: json["today_prices"] == null ? [] : List<TodayPrice>.from(json["today_prices"]!.map((x) => TodayPrice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date?.toIso8601String(),
    "remark": remark,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
    "today_prices": todayPrices == null ? [] : List<dynamic>.from(todayPrices!.map((x) => x.toJson())),
  };
}

class TodayPrice {
  int? id;
  int? dailyId;
  String? type;
  String? sellPrice;
  String? buyPrice;
  String? rice;
  String? remark;
  DateTime? createdAt;
  DateTime? updatedAt;

  TodayPrice({
    this.id,
    this.dailyId,
    this.type,
    this.sellPrice,
    this.buyPrice,
    this.rice,
    this.remark,
    this.createdAt,
    this.updatedAt,
  });

  factory TodayPrice.fromJson(Map<String, dynamic> json) => TodayPrice(
    id: json["id"],
    dailyId: json["daily_id"],
    type: json["type"],
    sellPrice: json["sell_price"],
    buyPrice: json["buy_price"],
    rice: json["rice"],
    remark: json["remark"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "daily_id": dailyId,
    "type": type,
    "sell_price": sellPrice,
    "buy_price": buyPrice,
    "rice": rice,
    "remark": remark,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
