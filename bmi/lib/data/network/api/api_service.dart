import 'dart:io';

import 'package:bmi/data/network/request_vo/product_order_request_vo.dart';
import 'package:bmi/data/network/response_vo/daily_prices_response_vo.dart';
import 'package:bmi/data/network/response_vo/get_product_cat_response_vo.dart';
import 'package:bmi/data/network/response_vo/get_product_response_vo.dart';
import 'package:bmi/data/network/response_vo/measurement_response_vo.dart';
import 'package:bmi/data/network/response_vo/order_history_response_vo.dart';
import 'package:bmi/data/network/response_vo/product_selling_order_response_vo.dart';
import 'package:bmi/data/network/response_vo/seller_type_response_vo.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../../const/api.dart';
import '../response_vo/login_response_vo.dart';
import '../response_vo/register_response_vo.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  ///Register

  @POST(registerEndpoint)
  Future<RegisterVo> doRegister(
    @Field("name") String name,
    @Field("phone_no") String phoneNumber,
    @Field("password") String password,
    @Field("address") String address,
    @Field("seller_type_id") int buyerCategory,
  );

  ///Login

  @POST(loginEndpoint)
  Future<LoginResponseVo> doLogin(
    @Field("phone_no") String phoneNumber,
    @Field("password") String password,
  );

  ///seller type

  @GET(getSellerTypeEndpoint)
  Future<SellerTypeVo> getSellerType();

  ///SellerProductType
  @POST(getProductTypeEndpoint)
  Future<GetProductResponseVo> getSellerProductType(
      @Field("product_category_id") int productCatID
      );

  ///product cat type

  @GET(getProductCatEndpoint)
  Future<GetProductCatResponseVo> getProductCat();

  ///Order
  @POST(sellOrderEndpoint)
  Future<ProductSellOrderResponseVo> sellProductOrder(
      @Field("seller_id") int sellerID,
      @Field("product_category_id") int? productCatID,
      @Field("seller_product_type_id") int? sellerProductTypeID,
      @Field("product_type_name") String productName,
      @Field("order_date") String orderDate,
      @Field("rice_percentage_one") int? ricePercentOne,
      @Field("rice_percentage_two") int? ricePercentTwo,
      @Field("moisture") int? moisture,
      @Field("weight") String weight,
      @Field("measurement_id") int? measurementId,
      @Field("total_amount") int totalAmount,
      @Field("price") int price,
      @Field("address") String address,
      @Field("category_prices_id") int? categoryID,
      @Field("export_or_local") int? exportOrLocal,
      @Field("remark") String? remark,
      @Field("phone_no") String phoneNo,
      @Field("photo") List<String> photo,
      );


  ///measurement

  @GET(getMeasurementEndpoint)
  Future<MeasurementResponseVo> getMeasurementData();

///Order History
  @POST(orderHistoryEndpoint)
  Future<OrderHistoryResponseVo> orderHistory(
      @Field("seller_id") int sellerID
      );

  ///Daily Prices
  @POST(dailyPricesEndpoint)
  Future<DailyPricesResponseVo> dailyPrices(
      @Field("today_date") String date
      );
}
