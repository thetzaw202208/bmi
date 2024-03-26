import 'package:bmi/data/network/data_agent/get_product_type/get_product_type_data_agent.dart';
import 'package:bmi/data/network/response_vo/get_product_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../api/api_service.dart';

class GetProductTypeDataAgentImpl extends GetProductTypeDataAgent {
  late ApiService _api;

  static final GetProductTypeDataAgentImpl _singleton =
      GetProductTypeDataAgentImpl._internal();

  factory GetProductTypeDataAgentImpl() {
    return _singleton;
  }

  GetProductTypeDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio, baseUrl: baseURL);
  }

  @override
  Future<GetProductResponseVo> getProductType(int productCatID) {
    return _api.getSellerProductType(productCatID);
  }
}
