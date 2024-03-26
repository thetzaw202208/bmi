import 'package:bmi/data/network/data_agent/get_product_type/get_product_type_data_agent.dart';
import 'package:bmi/data/network/data_agent/product_order/product_order_data_agent.dart';
import 'package:bmi/data/network/response_vo/get_product_response_vo.dart';
import 'package:bmi/data/network/response_vo/product_selling_order_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../api/api_service.dart';

class ProductOrderDataAgentImpl extends ProductOrderDataAgent {
  late ApiService _api;

  static final ProductOrderDataAgentImpl _singleton =
      ProductOrderDataAgentImpl._internal();

  factory ProductOrderDataAgentImpl() {
    return _singleton;
  }

  ProductOrderDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio, baseUrl: baseURL);
  }

  @override
  Future<ProductSellOrderResponseVo> productOrder(
      int productCatID,
      String sellerProductTypeID,
      String productName,
      String orderDate,
      int ricePercentOne,
      int ricePercentTwo,
      String weight,
      int measurementId,
      int totalAmount,
      int price,
      String address,
      String photo) {
    return _api.sellProductOrder(
        productCatID,
        sellerProductTypeID,
        productName,
        orderDate,
        ricePercentOne,
        ricePercentTwo,
        weight,
        measurementId,
        totalAmount,
        price,
        address,
        photo);
  }
}
